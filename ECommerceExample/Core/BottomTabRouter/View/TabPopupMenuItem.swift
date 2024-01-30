//
//  TabPopupMenuItem.swift
//  ECommerceExample
//
//  Created by Vladislav on 30.01.2024.
//

import SwiftUI

struct TabPopupMenuItem: View {
    let viewModel: PopupMenuViewModel
    let dimension: CGFloat = 48
    var body: some View {
        VStack(alignment: .center, spacing: 12) {
            ZStack {
                Circle()
                    .foregroundColor(Color(.systemBlue))
                    .frame(width: dimension, height: dimension)
                    .shadow(radius: 4)
                Image(systemName: viewModel.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(12)
                    .frame(width: dimension, height: dimension)
                    .foregroundColor(.white)
            }
            
            Text(viewModel.title)
                .foregroundColor(.white)
                .font(.footnote)
        }
    }
}

#Preview {
//    TabPopupMenuItem()
    EmptyView()
}
