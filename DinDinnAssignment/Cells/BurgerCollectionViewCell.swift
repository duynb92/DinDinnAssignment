//
//  BurgerCollectionViewCell.swift
//  DinDinnAssignment
//
//  Created by Duy Nguyen on 5/27/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit

class BurgerCollectionViewCell: UICollectionViewCell {
    
    var specialOffer : SpecialOffer?
    
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbPrice: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setSpecialOffer(_ specialOffer: SpecialOffer) {
        self.specialOffer = specialOffer
        lbName.text = specialOffer.offerName
        lbPrice.text = specialOffer.getOfferPriceText()
    }
}
