//
//  TabRouterView.swift
//  ECommerceExample
//
//  Created by Vladislav on 30.01.2024.
//

import SwiftUI

struct TabRouterView: View {
    @ObservedObject var router = BottomTabRouter()
    @State private var showMenu = false
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                Spacer()
                router.view
                Spacer()
                HStack {
                    TabIcon(routerViewModel: .home, router: router)
                    TabIcon(routerViewModel: .search, router: router)
                    TabMenuButton(showMenu: $showMenu)
                        .onTapGesture {
                            withAnimation {
                                showMenu.toggle()
                            }
                        }
                    TabIcon(routerViewModel: .notifications, router: router)
                    TabIcon(routerViewModel: .settings, router: router)
                }
                .frame(height: UIScreen.main.bounds.height / 8)
                .frame(maxWidth: .infinity)
                .background(Color(.systemGray5))
            }
            if showMenu {
                TabPopupMenu()
                    .padding(.bottom, 164)
            }
        }
        .ignoresSafeArea(.all, edges: .bottom)
        .preferredColorScheme(.dark)
    }
}

#Preview {
//    TabRouterView(router: ViewRouter())
    EmptyView()
}
