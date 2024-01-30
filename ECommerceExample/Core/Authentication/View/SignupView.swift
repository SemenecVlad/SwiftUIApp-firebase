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
    @State private var showPassword = false;
    @EnvironmentObject var viewModel: AuthViewModel;
    @Environment(\.dismiss) var dismiss
    
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
                        ZStack(alignment: .trailing) {
                            InputView(text: $password,
                                      title: "Password",
                                      placeholder: "Your password",
                                      isSecuredField: !showPassword)
                            Button {
                                showPassword.toggle()
                            } label: {
                                Image(systemName: showPassword ? "eye" : "eye.slash")
                                    .imageScale(.small)
                                    .font(.title2)
                                    .foregroundColor(Color(.systemGray))
                                    .padding(.top, 15)
                                    .padding(.trailing, 10)
                            }
                        }
                    }.padding(.top, 20)
                    Button {
                        print("SHIT \(viewModel)")
                        Task {
                            try await viewModel.createUser(withEmail: email, password: password, fullName: fullName)
                            dismiss()
                        }
                    } label: {
                        BigButton(name: "CREATE ACCOUNT")
                    }
                    .disabled(!formIsValid)
                    .opacity(formIsValid ? 1.0 : 0.5)
                     
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

extension SignupView: AuthFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
                && email.contains("@")
                && !password.isEmpty
        && password.count > 5
        && !firstName.isEmpty
        && !lastName.isEmpty
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}


