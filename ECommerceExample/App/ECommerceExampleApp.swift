//
//  ECommerceExampleApp.swift
//  ECommerceExample
//
//  Created by Vladislav on 12.09.2023.
//

import SwiftUI
import Firebase

@main
struct ECommerceExampleApp: App {
    @StateObject var viewModel = AuthViewModel();
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView()
                    .environmentObject(viewModel)
            }
        }
    }
}
