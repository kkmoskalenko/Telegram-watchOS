//
//  BadgeView.swift
//  Telegram WatchKit Extension
//
//  Created by Konstantin Moskalenko on 19.03.2021.
//

import SwiftUI

struct BadgeView: View {
    var value: String
    
    init?(_ value: String?) {
        if let value = value {
            self.value = value
        } else { return nil }
    }
    
    var body: some View {
        Text(value)
            .font(.system(size: fontSize))
            .frame(width: width, height: height)
            .padding(.horizontal, padding)
            .foregroundColor(Color.white)
            .background(Color.accentColor)
            .clipShape(Capsule())
            .fixedSize()
    }
    
    private let fontSize: CGFloat = 14
    private let height: CGFloat = 17
    
    private var width: CGFloat? {
        value.count > 1 ? nil : height
    }
    
    private var padding: CGFloat {
        value.count > 1 ? 4 : 0
    }
}
