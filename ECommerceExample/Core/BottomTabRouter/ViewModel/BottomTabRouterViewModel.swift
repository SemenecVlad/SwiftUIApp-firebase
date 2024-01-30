//
//  BottomTabRouterViewModel.swift
//  ECommerceExample
//
//  Created by Vladislav on 30.01.2024.
//

import SwiftUI

enum BottomTabRouterViewModel: Int, CaseIterable {
    case home
    case search
    case notifications
    case settings
    
    var imageName: String {
        switch self {
        case .home: return "house"
        case .search: return "magnifyingglass"
        case .notifications: return "bell.fill"
        case .settings: return "gear"
        }
    }
    
    @ViewBuilder
    var view: some View {
        switch self {
        case .home:
            HomeView()
        case .search:
             Text("Search")
        case .notifications:
             Text("Notifications")
        case .settings:
            ProfileView()
        }
    }
}
