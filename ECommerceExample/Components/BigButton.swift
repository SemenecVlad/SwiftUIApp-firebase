//
//  BigButton.swift
//  ECommerceExample
//
//  Created by Vladislav on 12.09.2023.
//

import SwiftUI

struct BigButton: View {
    let name: String
    
    var body: some View {
        HStack {
            Text(name)
                .frame(minWidth: 0, maxWidth: .infinity)
                .font(.system(size: 18))
                .padding()
                .foregroundColor(.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(.white, lineWidth: 2)
                )
                .background(Color.yellow)
                .cornerRadius(25)
                .frame(width: UIScreen.main.bounds.width - 32, height: 60)
        }
    }
}
