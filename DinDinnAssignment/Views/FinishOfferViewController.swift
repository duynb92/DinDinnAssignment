//
//  FinishOfferViewController.swift
//  DinDinnAssignment
//
//  Created by Duy Nguyen on 5/27/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit
import ViewAnimator
import Hero

class FinishOfferViewController: UIViewController {

    @IBOutlet weak var vGroupCart: CornerUIVIew!
    @IBOutlet weak var cstCartHeight: NSLayoutConstraint!
    @IBOutlet weak var lbPrice: UILabel!
    @IBOutlet weak var lbName: UILabel!
    
    var specialOffer: SpecialOffer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vGroupCart.hero.modifiers = [.translate(y: -cstCartHeight.constant), .useGlobalCoordinateSpace]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
    }
    
    //MARK: - Private Methods
    /// Update UI components to reflect associated model's data
    private func updateUI() {
        if let specialOffer = specialOffer {
            lbPrice.text = specialOffer.getOfferPriceText()
            lbName.text = specialOffer.offerName
        }
    }

    
    //MARK: - IBAction
    
    @IBAction func goToMenuClicked(_ sender: Any) {
        if let superView = (sender as! UIView).superview as? SpringUIView {
            superView.bounce(duration: 0.5, scale: 0.8, completion: { [weak self] _ in
                self?.view.window!.rootViewController?.dismiss(animated: true, completion: nil)
            })
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
