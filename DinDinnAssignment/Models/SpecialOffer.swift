//
//  SpecialOffer.swift
//  DinDinnAssignment
//
//  Created by Duy Nguyen on 5/28/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import Foundation

class SpecialOffer {
    var offerName: String?
    var offerWeight: Int?
    var offerPrice: Double?
    
    init(offerName: String?, offerWeight: Int?, offerPrice: Double?) {
        self.offerName = offerName
        self.offerWeight = offerWeight
        self.offerPrice = offerPrice
    }
    
    func getOfferWeightText() -> String {
        if let offerWeight = offerWeight {
            return "\(offerWeight)g"
        }
        return ""
    }
    
    func getOfferPriceText() -> String {
        if let offerPrice = offerPrice {
        return "$\(String(format: "%.2f", offerPrice))"
        }
        return ""
    }
}
