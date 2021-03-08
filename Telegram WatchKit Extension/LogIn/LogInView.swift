//
//  LogInView.swift
//  Telegram WatchKit Extension
//
//  Created by Konstantin Moskalenko on 08.03.2021.
//

import SwiftUI

struct LogInView: View {
    var link: String
    
    var body: some View {
        ScrollView {
            VStack(spacing: 3) {
                Text("Log in to Telegram by QR Code")
                    .font(.headline)
                    .fontWeight(.medium)
                    .fixedSize(horizontal: false, vertical: true)
                
                Spacer(minLength: 4)
                
                Group {
                    Text("Settings on your Phone")
                    Image(systemName: "chevron.down")
                    Text("Devices")
                    Image(systemName: "chevron.down")
                    Text("Scan QR")
                }
                .font(.footnote)
                .foregroundColor(.secondary)
                .fixedSize(horizontal: false, vertical: true)
                
                Spacer(minLength: 4)
                
                QRCodeShape(for: link)
                    .aspectRatio(contentMode: .fill)
                    .foregroundColor(.black)
                    .padding(11)
                    .background(RoundedRectangle(
                        cornerRadius: 9
                    ))
            }
            .multilineTextAlignment(.center)
        }
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        let link = """
            tg://login?token=ABC-\
            qZ0bq9DmJi3vGUGsRv5XA\
            E49BOHZpEeVHuBxutdYZA
            """
        return LogInView(link: link)
    }
}
