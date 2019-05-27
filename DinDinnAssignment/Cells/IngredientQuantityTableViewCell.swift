//
//  IngredientQuantityTableViewCell.swift
//  DinDinnAssignment
//
//  Created by Duy Nguyen on 5/27/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit

protocol IngredientQuantityTableViewCellDelegate {
    func didIncreaseQuantity(_ ingredient: Ingredient)
    func didDecreaseQuantity(_ ingredient: Ingredient)
}

class IngredientQuantityTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbQuantity: UILabel!
    @IBOutlet weak var lbPrice: UILabel!
    
    var delegate: IngredientQuantityTableViewCellDelegate?
    
    var ingredient: Ingredient?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setIngredient(_ ingredient: Ingredient) {
        self.ingredient = ingredient
        lbQuantity.text = "\(ingredient.quantity)"
        lbName.text = ingredient.name
        lbPrice.text = ingredient.getPriceText()
    }
    
    @IBAction func decreaseClicked(_ sender: Any) {
        if let ingredient = ingredient {
            if ingredient.quantity > 0 {
                ingredient.quantity -= 1
                lbQuantity.text = "\(ingredient.quantity)"
            }
            if let delegate = delegate {
                delegate.didDecreaseQuantity(ingredient)
            }
        }
    }
    
    @IBAction func increaseClicked(_ sender: Any) {
        if let ingredient = ingredient {
            ingredient.quantity += 1
            lbQuantity.text = "\(ingredient.quantity)"
            if let delegate = delegate {
                delegate.didIncreaseQuantity(ingredient)
            }
        }
    }
}
