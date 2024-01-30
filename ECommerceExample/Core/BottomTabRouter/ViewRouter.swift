//
//  ViewRouter.swift
//  ECommerceExample
//
//  Created by Vladislav on 30.01.2024.
//

import Foundation
import SwiftUI

class BottomTabRouter: ObservableObject {
    @Published var currentItem: BottomTabRouterViewModel = .home
    
    var view: some View {return currentItem.view}
}
