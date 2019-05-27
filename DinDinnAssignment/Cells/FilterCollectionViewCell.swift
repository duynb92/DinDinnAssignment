//
//  FilterCollectionViewCell.swift
//  DinDinnAssignment
//
//  Created by Duy Nguyen on 5/27/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit

class FilterCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var lbFilter: UILabel!
    
    var filter: String?

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setFilter(_ filter: String) {
        self.filter = filter
        lbFilter.text = filter
    }
}
