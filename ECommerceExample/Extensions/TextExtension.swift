//
//  TextExtension.swift
//  ECommerceExample
//
//  Created by Vladislav on 14.09.2023.
//

import SwiftUI

// All extensions putting here
extension Text {
    func labelStyle(_ color: Color) -> some View {
        modifier(TextLabelModifier(color: color))
    }
}

// Here is modifier that allow to add styling for input labels
struct TextLabelModifier: ViewModifier {
    let color: Color
    @State private var tapped: Bool = false
    
    func body(content: Content) -> some View {
        
        return content
            .foregroundColor(color)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, -2)
    }
}


