//
//  TelegramShape.swift
//  Telegram WatchKit Extension
//
//  Created by Konstantin Moskalenko on 17.03.2021.
//

import SwiftUI

struct TelegramShape: Shape {
    func path(in rect: CGRect) -> Path {
        let length = min(rect.width, rect.height) / 40
        return Path { path in
            path.move(to: CGPoint(x: 1.96, y: 9.12))
            path.addCurve(to: CGPoint(x: 15.57, y: 3.22), control1: CGPoint(x: 8.76, y: 6.14), control2: CGPoint(x: 13.3, y: 4.17))
            path.addCurve(to: CGPoint(x: 24.27, y: 0.03), control1: CGPoint(x: 22.05, y: 0.51), control2: CGPoint(x: 23.39, y: 0.04))
            path.addCurve(to: CGPoint(x: 25.17, y: 0.3), control1: CGPoint(x: 24.46, y: 0.02), control2: CGPoint(x: 24.89, y: 0.07))
            path.addCurve(to: CGPoint(x: 25.51, y: 0.94), control1: CGPoint(x: 25.41, y: 0.49), control2: CGPoint(x: 25.47, y: 0.75))
            path.addCurve(to: CGPoint(x: 25.54, y: 1.86), control1: CGPoint(x: 25.54, y: 1.12), control2: CGPoint(x: 25.58, y: 1.53))
            path.addCurve(to: CGPoint(x: 22.9, y: 18.72), control1: CGPoint(x: 25.19, y: 5.57), control2: CGPoint(x: 23.67, y: 14.57))
            path.addCurve(to: CGPoint(x: 21.31, y: 21.13), control1: CGPoint(x: 22.57, y: 20.48), control2: CGPoint(x: 21.93, y: 21.07))
            path.addCurve(to: CGPoint(x: 17.61, y: 19.36), control1: CGPoint(x: 19.95, y: 21.25), control2: CGPoint(x: 18.92, y: 20.23))
            path.addCurve(to: CGPoint(x: 12.41, y: 15.85), control1: CGPoint(x: 15.56, y: 18.01), control2: CGPoint(x: 14.4, y: 17.17))
            path.addCurve(to: CGPoint(x: 12.91, y: 12.11), control1: CGPoint(x: 10.1, y: 14.32), control2: CGPoint(x: 11.6, y: 13.48))
            path.addCurve(to: CGPoint(x: 19.34, y: 5.8), control1: CGPoint(x: 13.25, y: 11.75), control2: CGPoint(x: 19.22, y: 6.29))
            path.addCurve(to: CGPoint(x: 19.23, y: 5.38), control1: CGPoint(x: 19.35, y: 5.74), control2: CGPoint(x: 19.36, y: 5.51))
            path.addCurve(to: CGPoint(x: 18.74, y: 5.34), control1: CGPoint(x: 19.09, y: 5.26), control2: CGPoint(x: 18.89, y: 5.3))
            path.addCurve(to: CGPoint(x: 8.91, y: 11.88), control1: CGPoint(x: 18.54, y: 5.38), control2: CGPoint(x: 15.26, y: 7.56))
            path.addCurve(to: CGPoint(x: 6.38, y: 12.82), control1: CGPoint(x: 7.97, y: 12.52), control2: CGPoint(x: 7.13, y: 12.83))
            path.addCurve(to: CGPoint(x: 2.75, y: 11.95), control1: CGPoint(x: 5.54, y: 12.8), control2: CGPoint(x: 3.94, y: 12.34))
            path.addCurve(to: CGPoint(x: 0.23, y: 10.41), control1: CGPoint(x: 1.29, y: 11.48), control2: CGPoint(x: 0.13, y: 11.22))
            path.addCurve(to: CGPoint(x: 1.96, y: 9.12), control1: CGPoint(x: 0.28, y: 9.99), control2: CGPoint(x: 0.86, y: 9.56))
            path.closeSubpath()
        }
        .offsetBy(
            dx: rect.midX / length - 15.15,
            dy: rect.midY / length - 9.15)
        .scale(length, anchor: .topLeading)
        .path(in: rect)
    }
}
