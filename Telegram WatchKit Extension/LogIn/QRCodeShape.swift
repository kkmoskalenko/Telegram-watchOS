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
        
        var path = Path()
        for x in 0..<qr.size {
            for y in 0..<qr.size {
                guard qr.getModule(x: x, y: y)
                else { continue }
                
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
    
    init?(for text: String, ecl: QRCodeECC = .low) {
        guard let qr = try? QRCode.encode(
            text: text, ecl: ecl
        ) else { return nil }
        
        self.qr = qr
    }
}

struct QRCodeShape_Previews: PreviewProvider {
    static var previews: some View {
        QRCodeShape(for: "Hello, World!")
    }
}
