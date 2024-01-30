//
//  HomeView.swift
//  ECommerceExample
//
//  Created by Vladislav on 30.01.2024.
//

import SwiftUI

struct HomeView: View {
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    
    var body: some View {
        ScrollView {
            Text("Clothes Shop")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width - 40, alignment: .leading)
                .padding(.leading, 10)
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(productList, id: \.id) { item in
                    ProductCard(product: item)
                }
            }
        }
        .padding(10)
    }
}

#Preview {
    HomeView()
}
