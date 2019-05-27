//
//  Ingredient.swift
//  DinDinnAssignment
//
//  Created by Duy Nguyen on 5/28/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import Foundation

class Ingredient {
    var id: Int = 0
    var name: String?
    var price: Double?
    var quantity: Int = 0
    
    init(id: Int, name: String?, price: Double?, quantity: Int) {
        self.id = id
        self.name = name
        self.price = price
        self.quantity = quantity
    }
    
    func getPriceText() -> String {
        if let price = price {
            return "$\(price)"
        }
        return ""
    }
}
