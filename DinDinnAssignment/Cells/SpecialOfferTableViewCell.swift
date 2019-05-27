//
//  SpecialOfferTableViewCell.swift
//  DinDinnAssignment
//
//  Created by Duy Nguyen on 5/27/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit
import Hero

protocol SpecialOfferTableViewCellDelegate {
    func didSelectOffer(index: Int)
}

class SpecialOfferTableViewCell: UITableViewCell {

    @IBOutlet weak var colOffers: UICollectionView!
    
    var specialOffers: [SpecialOffer] = []
    var delegate: SpecialOfferTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        colOffers.delegate = self
        colOffers.dataSource = self
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

extension SpecialOfferTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return specialOffers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BurgerCollectionViewCell", for: indexPath) as! BurgerCollectionViewCell
        cell.hero.id = "burger_\(indexPath.row)"
        cell.setSpecialOffer(specialOffers[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 140, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let delegate = delegate {
            delegate.didSelectOffer(index: indexPath.row)
        }
    }
}
