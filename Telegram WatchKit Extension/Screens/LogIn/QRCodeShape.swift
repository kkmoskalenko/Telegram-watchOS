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
    private let excludeMiddle: Bool
    
    func path(in rect: CGRect) -> Path {
        let length = min(rect.width, rect.height)
        let moduleSize = length / CGFloat(qr.size)
        
        let middleSize = 9 * qr.size / 25
        let middle = middleSize ..< qr.size - middleSize
        
        var path = Path()
        for x in 0..<qr.size {
            for y in 0..<qr.size {
                guard qr.getModule(x: x, y: y)
                else { continue }
                
                if excludeMiddle, middle ~= x,
                   middle ~= y { continue }
                
                path.addRect(CGRect(
                    x: CGFloat(x) * moduleSize,
                    y: CGFloat(y) * moduleSize,
                    width: moduleSize,
                    height: moduleSize
                ))
            }
        }
        
        return path
    }
    
    init?(for text: String,
          excludeMiddle: Bool = true,
          ecl: QRCodeECC = .quartile
    ) {
        guard let qr = try? QRCode.encode(
            text: text, ecl: ecl
        ) else { return nil }
        
        self.qr = qr
        self.excludeMiddle = excludeMiddle
    }
}

struct QRCodeShape_Previews: PreviewProvider {
    static var previews: some View {
        QRCodeShape(for: "Hello, World!")
    }
}
