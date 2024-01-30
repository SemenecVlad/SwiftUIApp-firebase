//
//  TabIcon.swift
//  ECommerceExample
//
//  Created by Vladislav on 30.01.2024.
//

import SwiftUI

struct TabIcon: View {
    let routerViewModel: BottomTabRouterViewModel
    @ObservedObject var router: BottomTabRouter
    
    var body: some View {
        Button {
            router.currentItem = routerViewModel
        } label: {
            Image(systemName: routerViewModel.imageName)
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .frame(width: 20, height: 20)
                .frame(maxWidth: .infinity)
                .foregroundColor(router.currentItem == routerViewModel ? .white : .gray)
        }
    }
}

#Preview {
    EmptyView()
}
