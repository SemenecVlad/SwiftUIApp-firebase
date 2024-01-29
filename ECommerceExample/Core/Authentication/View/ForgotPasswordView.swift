//
//  ForgotPasswordView.swift
//  ECommerceExample
//
//  Created by Vladislav on 29.01.2024.
//

import SwiftUI

struct ForgotPasswordView: View {
    @State private var email = "";
    @State private var animateGradient = false;
    @State private var showSuccessAlert = false;
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            ZStack {
                AnimatedLinearGradient(colors: [.yellow, .mint], duration: 2, animateGradient: $animateGradient)
                VStack {
                    Text("FORGOT PASSWORD")
                        .foregroundColor(.white)
                        .bold()
                        .font(.largeTitle)
                    Spacer().frame(height: 30)
                    InputView(text: $email,
                              title: "Email",
                              placeholder: "test@test.com")
                    
                    
                    Button(action: {
                        dismiss()
                    }, label: {
                        BigButton(name: "CONFIRM")
                    })
                }
                .padding()
            }
        }
        .alert("Success", isPresented: $showSuccessAlert) {
            // All buttons for alert place here
        } message: {
            VStack {
                Text("If email address exists in our database, you will receive an email with instuctions on how to restore your password")
               
            }
        }
    }
}

