//
//  MenuViewController.swift
//  DinDinnAssignment
//
//  Created by Duy Nguyen on 5/27/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit
import ViewAnimator

class MenuViewController: UIViewController {

    @IBOutlet weak var colFilters: UICollectionView!
    @IBOutlet weak var tblMenu: UITableView!
    @IBOutlet weak var cstTableHeight: NSLayoutConstraint!
    
    //hard-code data
    var filters = ["Chicken", "Beef", "Fish", "Cheese", "Vegetables"]
    var specialOffers = [SpecialOffer(offerName: "Cheese Burger", offerWeight: 525, offerPrice: 4.16),
                         SpecialOffer(offerName: "Cheese Burger 2", offerWeight: 525, offerPrice: 4.16),
                         SpecialOffer(offerName: "Cheese Burger 3", offerWeight: 525, offerPrice: 4.16),
                         SpecialOffer(offerName: "Cheese Burger 4", offerWeight: 525, offerPrice: 4.16),
                         SpecialOffer(offerName: "Cheese Burger 5", offerWeight: 525, offerPrice: 4.16),
                         SpecialOffer(offerName: "Cheese Burger 6", offerWeight: 525, offerPrice: 4.16),
                         SpecialOffer(offerName: "Cheese Burger 7", offerWeight: 525, offerPrice: 4.16)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblMenu.delegate = self
        tblMenu.dataSource = self
        colFilters.delegate = self
        colFilters.dataSource = self
        
        //add observer on table view's height
        //add observer for content size
        tblMenu.addObserver(self, forKeyPath: "contentSize", options: NSKeyValueObservingOptions(rawValue: 0), context: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tblMenu.reloadData()
        //animate cells in table
        let animations = [AnimationType.from(direction: .bottom, offset: 30.0)]
        UIView.animate(views: tblMenu.visibleCells, animations: animations, initialAlpha: 1.0,
                       finalAlpha: 1.0, duration: 1.0, completion: {})
    }

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if keyPath == "contentSize" {
            cstTableHeight.constant = self.tblMenu.contentSize.height
            self.view.layoutIfNeeded()
        }
    }
    
    deinit {
        //remove observer - prevent crash and memory leak
        if tblMenu != nil &&  tblMenu.observationInfo != nil {
            tblMenu.removeObserver(self, forKeyPath: "contentSize")
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "ShowOfferDetail") {
            if let destinationVC = segue.destination as? OfferViewController {
                _ = destinationVC.view
                destinationVC.hero.isEnabled = true
                if let dict = sender as? [String:Int], let index = dict["index"] {
                    destinationVC.ivBurger.hero.id = "burger_\(index)"
                    destinationVC.specialOffer = specialOffers[index]
                }
            }
        }
    }

}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row % 2 == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "BurgerTableViewCell", for: indexPath) as! BurgerTableViewCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SpecialOfferTableViewCell", for: indexPath) as! SpecialOfferTableViewCell
            cell.specialOffers = specialOffers
            cell.colOffers.reloadData()
            cell.delegate = self
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row % 2 == 0 {
            return 230
        } else {
            return 250
        }
    }
}

extension MenuViewController: SpecialOfferTableViewCellDelegate {
    func didSelectOffer(index: Int) {
        performSegue(withIdentifier: "ShowOfferDetail", sender: ["index": index])
    }
}

extension MenuViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilterCollectionViewCell", for: indexPath) as! FilterCollectionViewCell
        cell.setFilter(filters[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let estimatedSize = NSString(string: filters[indexPath.row]).size(withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17)])
        
        return CGSize(width: estimatedSize.width + 20, height: 40)
    }
}
