//
//  ContentView.swift
//  ECommerceExample
//
//  Created by Vladislav on 29.01.2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {
        Group {
            if (viewModel.userSession != nil) {
                ProfileView()
            } else {
                WelcomeView()
            }
        }
    }
}


