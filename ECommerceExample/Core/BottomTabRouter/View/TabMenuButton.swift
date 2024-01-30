//
//  TabMenuButton.swift
//  ECommerceExample
//
//  Created by Vladislav on 30.01.2024.
//

import SwiftUI

struct TabMenuButton: View {
    @Binding var showMenu: Bool
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(.white)
                .frame(width: 56, height: 56)
                .shadow(radius: 4)
            Image(systemName: "plus.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 52, height: 52)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .rotationEffect(Angle(degrees: showMenu ? 45 : 0))
        }
        .offset(y: -44)
    }
}
