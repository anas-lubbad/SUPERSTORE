//
//  Product.swift
//  Superstore
//
//  Created by anas on 12/12/2021.
//

import Foundation
import UIKit

struct Product: Codable {
    var id: Int
    var title: String
    var price: Double
    var image: String
    var category: String
    var description: String
}
