//
//  AnimatedLinearGradient.swift
//  ECommerceExample
//
//  Created by Vladislav on 14.09.2023.
//

import SwiftUI

struct AnimatedLinearGradient: View {
    let colors: Array<Color>
    let duration: Double
    @Binding var animateGradient: Bool
    
    var body: some View {
        LinearGradient(colors: colors, startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
            .hueRotation(.degrees(animateGradient ? -45 : 0))
            .modifier(LinearAnimation(duration: duration, animateGradient: $animateGradient))
    }
}

private struct LinearAnimation: ViewModifier {
    let duration: Double;
    @Binding var animateGradient: Bool;

    func body(content: Content) -> some View {
        
        return content
            .onAppear {
                withAnimation(
                    .easeInOut(duration: duration)
                    .repeatForever(autoreverses: true)
                ) {
                    animateGradient.toggle()
                }
            }
            .modifier(EmptyModifier())
    }
}
