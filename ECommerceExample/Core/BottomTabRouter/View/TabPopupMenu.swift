//
//  TabPopupMenu.swift
//  ECommerceExample
//
//  Created by Vladislav on 30.01.2024.
//

import SwiftUI

struct TabPopupMenu: View {
    
    var body: some View {
        HStack(spacing: 30) {
            Spacer()
            
            ForEach(PopupMenuViewModel.allCases, id: \.self) { item in
                TabPopupMenuItem(viewModel: item)
            }
            
            Spacer()
        }
        .transition(.scale)
    }
}

#Preview {
    TabPopupMenu()
}
