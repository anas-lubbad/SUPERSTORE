//
//  Cart.swift
//  Superstore
//
//  Created by anas on 14/12/2021.
//

import Foundation

struct Cart: Codable {
    var id: Int
    var products: [Products]
}

struct Products: Codable {
    var productId: Int
    var quantity: Int
}
