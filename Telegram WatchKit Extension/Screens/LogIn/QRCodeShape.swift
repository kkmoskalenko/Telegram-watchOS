//
//  QRCodeShape.swift
//  Telegram WatchKit Extension
//
//  Created by Konstantin Moskalenko on 08.03.2021.
//

import SwiftUI
import QRCodeGenerator

struct QRCodeShape: Shape {
    private let qr: QRCode
    
    func path(in rect: CGRect) -> Path {
        let length = min(rect.width, rect.height)
        let moduleSize = length / CGFloat(qr.size)
        
        let cornerSize = CGSize(
            width: 0.3 * moduleSize,
            height: 0.3 * moduleSize)
        
        var path = Path()
        for x in 0..<qr.size {
            for y in 0..<qr.size {
                guard qr[x, y] else { continue }
                
                path.addRoundedRect(in: CGRect(
                    x: CGFloat(x) * moduleSize,
                    y: CGFloat(y) * moduleSize,
                    width: moduleSize,
                    height: moduleSize
                ),
                cornerSize: cornerSize,
                corners: qr.getCorners(x: x, y: y))
            }
        }
        
        path.addFinderPattern(.topLeading, moduleSize: moduleSize)
        path.addFinderPattern(.topTrailing, moduleSize: moduleSize)
        path.addFinderPattern(.bottomLeading, moduleSize: moduleSize)
        
        return path
    }
    
    init?(for text: String, ecl: QRCodeECC = .quartile) {
        guard let qr = try? QRCode.encode(
            text: text, ecl: ecl
        ) else { return nil }
        
        self.qr = qr
    }
}

// MARK: - Extensions

extension QRCode {
    private func isFinderPattern(x: Int, y: Int) -> Bool {
        let patternSize = 7
        let top = (0 ..< patternSize) ~= y
        let left = (0 ..< patternSize) ~= x
        let bottom = (size - patternSize ..< size) ~= y
        let right = (size - patternSize ..< size) ~= x
        return (top && left) || (top && right) || (bottom && left)
    }
    
    fileprivate subscript(x: Int, y: Int) -> Bool {
        let middleSize = 9 * size / 25
        let middle = middleSize ..< size - middleSize
        return getModule(x: x, y: y) &&
            !(middle ~= x && middle ~= y) &&
            !isFinderPattern(x: x, y: y)
    }
    
    fileprivate func getCorners(x: Int, y: Int) -> UIRectCorner {
        var corners: UIRectCorner = []
        if !self[x - 1, y] && !self[x, y - 1] { corners.insert(.topLeft) }
        if !self[x + 1, y] && !self[x, y - 1] { corners.insert(.topRight) }
        if !self[x - 1, y] && !self[x, y + 1] { corners.insert(.bottomLeft) }
        if !self[x + 1, y] && !self[x, y + 1] { corners.insert(.bottomRight) }
        return corners
    }
}

extension Path {
    fileprivate mutating func addRoundedRect(
        in rect: CGRect, cornerSize: CGSize,
        corners: UIRectCorner = .allCorners,
        reversing: Bool = false
    ) {
        var path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: cornerSize)
        if reversing { path = path.reversing() }
        return addPath(Path(path.cgPath))
    }
    
    fileprivate mutating func addFinderPattern(
        _ position: Alignment, moduleSize: CGFloat
    ) {
        let roundedCorners: UIRectCorner
        var patternRect = CGRect(origin: .zero, size: CGSize(
            width: 7 * moduleSize, height: 7 * moduleSize
        ))
        
        switch position {
            case .topLeading:
                roundedCorners = [.topLeft, .topRight, .bottomLeft]
            case .topTrailing:
                roundedCorners = [.topLeft, .topRight, .bottomRight]
                patternRect.origin.x = boundingRect.maxX - patternRect.width
            case .bottomLeading:
                roundedCorners = [.topLeft, .bottomRight, .bottomLeft]
                patternRect.origin.y = boundingRect.maxY - patternRect.height
            default: return
        }
        
        for i in 0..<3 {
            if i > 0 {
                patternRect = patternRect.insetBy(
                    dx: moduleSize, dy: moduleSize)
            }
            let cornerSize = CGSize(
                width: patternRect.width / 3.5,
                height: patternRect.height / 3.5)
            addRoundedRect(
                in: patternRect, cornerSize: cornerSize,
                corners: roundedCorners, reversing: i == 1)
        }
    }
}

// MARK: - Previews

struct QRCodeShape_Previews: PreviewProvider {
    static var previews: some View {
        QRCodeShape(for: "Hello, World!")
    }
}
