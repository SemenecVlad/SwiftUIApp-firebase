//
//  InputView.swift
//  ECommerceExample
//
//  Created by Vladislav on 29.01.2024.
//

import SwiftUI

struct InputView: View {
    @Binding var text: String
    let title: String
    let placeholder: String
    var isSecuredField = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title).labelStyle(.white)
            
            if (isSecuredField) {
                SecureField(placeholder, text: $text)
                    .padding(15)
                    .background(.white)
                    .cornerRadius(10)
                    .tint(Color.mint)
            } else {
                TextField(placeholder, text: $text)
                    .padding(15)
                    .background(.white)
                    .cornerRadius(10)
                    .tint(Color.mint)
            }
            Divider()
        }
    }
}
