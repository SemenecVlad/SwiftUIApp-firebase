//
//  WelcomeView.swift
//  ECommerceExample
//
//  Created by Vladislav on 29.01.2024.
//

import SwiftUI

struct WelcomeView: View {
    @State private var animateGradient = false;
    @EnvironmentObject var viewModel: AuthViewModel;

    var body: some View {
        ZStack {
            AnimatedLinearGradient(colors: [.yellow, .mint], duration: 2, animateGradient: $animateGradient)
            VStack {
                Spacer()
                AsyncImage(url: URL(string: "https://img.freepik.com/free-vector/creative-welcome-to-the-team-banner-for-corporate-hiring_1017-43282.jpg?w=2000"), transaction: Transaction(animation: .spring(response: 0.6, dampingFraction: 0.45))) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image.resizable()
                            .transition(.scale)
                            .frame(width: 350, height: 250)
                            .overlay(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(.white, lineWidth: 2))
                            .cornerRadius(25)                                            
                    case .failure(_):
                        Image(systemName: "ant.circle.fill").resizable()
                    @unknown default:
                        Image(systemName: "ant.circle.fill").resizable()
                    }
                    }
                Spacer()
                Spacer()
                
                NavigationLink {
                    LoginView().environmentObject(viewModel)
                } label: {
                    BigButton(name: "SIGN IN")
                }
                NavigationLink {
                    SignupView().environmentObject(viewModel)
                } label: {
                    BigButton(name: "SIGN UP")
                }
                
            }
            .padding()
        }
    }
}

#Preview {
    WelcomeView()
}
