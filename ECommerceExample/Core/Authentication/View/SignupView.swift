//
//  SignupView.swift
//  ECommerceExample
//
//  Created by Vladislav on 29.01.2024.
//

import SwiftUI
import UIKit

struct SignupView: View {
    @State private var firstName = "";
    @State private var lastName = "";
    @State private var email = "";
    @State private var password = "";
    @State private var animateGradient = false;
    @State private var showSuccessAlert = false;
    @EnvironmentObject var viewModel: AuthViewModel;
    
    private var fullName: String {
        return "\(firstName) \(lastName)"
    }
    
    var body: some View {
        VStack {
            ZStack {
                AnimatedLinearGradient(colors: [.yellow, .mint], duration: 2, animateGradient: $animateGradient)
                VStack(spacing: 10) {
                    Text("SIGN UP")
                        .foregroundColor(.white)
                        .bold()
                        .font(.largeTitle)
                    
                    VStack {
                        InputView(text: $firstName,
                                  title: "First Name",
                                  placeholder: "John")
                        InputView(text: $lastName,
                                  title: "Last Name",
                                  placeholder: "Doe")
                        InputView(text: $email,
                                  title: "Email",
                                  placeholder: "test@test.com")
                            .autocapitalization(.none)
                        InputView(text: $password,
                                  title: "Password",
                                  placeholder: "Your password",
                                  isSecuredField: true)
                    }.padding(.top, 20)
                    Button {
                        print("SHIT \(viewModel)")
                        Task {
                            try await viewModel.createUser(withEmail: email, password: password, fullName: fullName)
                        }
                    } label: {
                        BigButton(name: "CREATE ACCOUNT")
                    }
                     
                    Spacer()
                    NavigationLink {
                        LoginView()
                    } label: {
                        HStack(spacing: 10) {
                            Text("Already have an account?")
                            Text("Sign in")
                        }
                    }
                }.padding()
            }
            .alert("Registration Completed", isPresented: $showSuccessAlert) {
                // All buttons for alert place here
            } message: {
                Text("You successfully created account")
            }
        }
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}

extension UINavigationController {
    override open func viewWillLayoutSubviews() {
        let transparentAppearance = UINavigationBarAppearance()
        transparentAppearance.configureWithTransparentBackground()
        transparentAppearance.backgroundColor = .clear
        transparentAppearance.shadowColor = .clear
        navigationBar.standardAppearance = transparentAppearance
        navigationBar.compactAppearance = transparentAppearance
        navigationBar.scrollEdgeAppearance = transparentAppearance
    }
}
