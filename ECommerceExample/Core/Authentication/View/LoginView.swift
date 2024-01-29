//
//  LoginView.swift
//  ECommerceExample
//
//  Created by Vladislav on 29.01.2024.
//

import SwiftUI

struct LoginView: View {
    @State private var email = "";
    @State private var password = "";
    @State private var animateGradient = false;
    @State private var showSuccessAlert = false;
    @EnvironmentObject var viewModel: AuthViewModel;
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            ZStack {
                AnimatedLinearGradient(colors: [.yellow, .mint], duration: 2, animateGradient: $animateGradient)
                VStack {
                    Text("SIGN IN")
                        .foregroundColor(.white)
                        .bold()
                        .font(.largeTitle)

                    VStack(spacing: 5) {
                        InputView(text: $email,
                                  title: "Email",
                                  placeholder: "test@test.com")
                            .autocapitalization(.none)
                        InputView(text: $password,
                                  title: "Password",
                                  placeholder: "Your password",
                                  isSecuredField: true)
                    }
                    .padding(.top, 20)
                    
                    NavigationLink {
                        ForgotPasswordView()
                    } label: {
                        HStack(alignment: .center) {
                            Text("Forgot your password?")
                                .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                        .padding(.bottom, 10)
                    }
                    Button {
                        Task {
                            try await viewModel.signIn(withEmail: email, password: password)
                            dismiss()
                        }
                        
                    } label: {
                        BigButton(name: "Login")
                    }
                    Spacer()
                    NavigationLink {
                        SignupView()
                    } label: {
                        HStack(spacing: 10) {
                            Text("Don't have an account?")
                            Text("Sign up")
                        }
                    }
                    

                }
                .padding()
            }
        }
        .alert("Login Success", isPresented: $showSuccessAlert) {
            // All buttons for alert place here
        } message: {
            VStack {
                Text("You successfully logged in to the app.\n Your email: \(email).\n Your password: \(password)")
               
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
