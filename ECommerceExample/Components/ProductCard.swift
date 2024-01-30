//
//  ProductCard.swift
//  ECommerceExample
//
//  Created by Vladislav on 30.01.2024.
//

import SwiftUI

struct ProductCard: View {
    var product: Product
    var body: some View {
        ZStack(alignment: .topTrailing) {
            ZStack(alignment: .bottom) {
                Image(product.image)
                    .resizable()
                    .cornerRadius(20)
                    .frame(width: 180)
    //                .scaledToFit()
                VStack(alignment: .leading) {
                    Text(product.name)
                        .bold()
                    Text("\(product.price)$")
                        .font(.caption)
                }
                .padding()
                .frame(width: 180, alignment: .leading)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
            }
            .frame(width: 180, height: 250)
            .shadow(radius: 3)
            
            Button {
                
            } label: {
                Image(systemName: "plus")
                    .padding(10)
                    .foregroundColor(.white)
                    .background(.black)
                    .cornerRadius(40)
                    .padding()
            }
        }
    }
}

#Preview {
    ProductCard(product: productList[5])
}
