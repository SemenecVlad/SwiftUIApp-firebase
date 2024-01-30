//
//  Product.swift
//  ECommerceExample
//
//  Created by Vladislav on 30.01.2024.
//

import Foundation

struct Product: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var price: Int
}

var productList = [
    Product(name: "Sweater cool", image: "c1", price: 100),
    Product(name: "Sweater awesome", image: "c2", price: 89),
    Product(name: "Sweater white", image: "c3", price: 93),
    Product(name: "Sweater warm", image: "c4", price: 122),
    Product(name: "Sweater blue", image: "c5", price: 101),
    Product(name: "Sweater red", image: "c7", price: 56),
    Product(name: "Sweater sea", image: "c7", price: 82),
]
