//
//  OfferViewController.swift
//  DinDinnAssignment
//
//  Created by Duy Nguyen on 5/27/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit
import iCarousel
import ViewAnimator

class OfferViewController: UIViewController {

    @IBOutlet weak var lbWeight: UILabel!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var sclMain: UIScrollView!
    @IBOutlet weak var ivBurger: UIImageView!
    @IBOutlet weak var lbPrice: SubscriptCountingUILabel!
    @IBOutlet weak var vIngredients: iCarousel!
    @IBOutlet weak var vAddToCart: CornerUIVIew!
    @IBOutlet weak var vGroupIngredients: CornerUIVIew!
    @IBOutlet weak var tblIngredientsQuantity: UITableView!
    @IBOutlet weak var cstIngredientsHeight: NSLayoutConstraint!
    @IBOutlet weak var cstIngredientsQuantityHeight: NSLayoutConstraint!
    
    var specialOffer: SpecialOffer?
    
    let defaultAnimationDuration = 0.5
    var ingredients = [Ingredient(id: 1, name: "Gauca", price: 0.5, quantity: 1),
                       Ingredient(id: 2, name: "Germantas", price: 0.15, quantity: 1),
                       Ingredient(id: 3, name: "Comte", price: 0.75, quantity: 1),
                       Ingredient(id: 4, name: "Tomatoes", price: 1.5, quantity: 1)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vIngredients.delegate = self
        vIngredients.dataSource = self
        tblIngredientsQuantity.delegate = self
        tblIngredientsQuantity.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let animations = [AnimationType.from(direction: .bottom, offset: 30.0)]
        UIView.animate(views: [vGroupIngredients], animations: animations, duration: defaultAnimationDuration)
        UIView.animate(views: vIngredients.visibleItemViews as! [UIView], animations: animations, delay: defaultAnimationDuration, duration: defaultAnimationDuration)
        UIView.animate(views: [vAddToCart], animations: animations, delay: defaultAnimationDuration, duration: defaultAnimationDuration)
        
    }
    
    //MARK: - Private Methods
    
    /// Update UI when price changed
    private func updatePrice() {
        if let specialOffer = specialOffer {
            lbPrice.setText(specialOffer.getOfferPriceText())
        }
    }
    
    
    /// Update UI components to reflect associated model's data
    private func updateUI() {
        if let specialOffer = specialOffer {
        updatePrice()
            lbPrice.text = specialOffer.getOfferPriceText()
            lbWeight.text = specialOffer.getOfferWeightText()
            lbName.text = specialOffer.offerName
        }
    }
    
    
    
    //MARK: - IBAction

    @IBAction func backClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func heartClicked(_ sender: Any) {
    }
    
    @IBAction func addToCartClicked(_ sender: Any) {
        if let superView = (sender as! UIView).superview as? SpringUIView {
            superView.bounce(duration: CGFloat(defaultAnimationDuration), scale: 0.8, completion: nil)
        }
        
        self.view.layoutIfNeeded()
        UIView.animate(withDuration: defaultAnimationDuration, animations: {
            self.vGroupIngredients.frame.origin.y = UIScreen.main.bounds.height
            self.view.layoutIfNeeded()
            self.ivBurger.transform = .identity
        }, completion: { completed in
            self.performSegue(withIdentifier: "ShowFinishOffer", sender: nil)
        })
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowFinishOffer" {
            let destinationVC = segue.destination as! FinishOfferViewController
            destinationVC.specialOffer = specialOffer
        }
    }
}


extension OfferViewController: iCarouselDataSource, iCarouselDelegate {
    func numberOfItems(in carousel: iCarousel) -> Int {
        return 10
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        var returnView: IngredientView?
        if (view == nil) {
            returnView = Bundle.main.loadNibNamed("IngredientView", owner: self, options: nil)?.first as? IngredientView
        } else {
            returnView = view as? IngredientView
        }
        return returnView!
    }
    
    func carousel(_ carousel: iCarousel, valueFor option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
        switch option {
        case .spacing:
            return 1.1
        case .wrap:
            return 1.0
        default:
            return value
        }
    }
    
    func carousel(_ carousel: iCarousel, didSelectItemAt index: Int) {
        let view = carousel.itemView(at: index) as? IngredientView
        let ingredientCircularView = view?.subviews.first as? IngredientCircularView
        ingredientCircularView?.animateShapeLayer(duration: 1)
        
        if (cstIngredientsHeight.constant < 500) {
            self.view.layoutIfNeeded()
            
            UIView.animate(withDuration: 0.5, animations: {
                self.cstIngredientsHeight.constant = 500
                self.cstIngredientsQuantityHeight.constant = 250
                self.view.layoutIfNeeded()
                self.ivBurger.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            }, completion: { completed in
                
            })
            
            let animations = [AnimationType.from(direction: .bottom, offset: 30.0)]
            UIView.animate(views: tblIngredientsQuantity.visibleCells, animations: animations, delay: 0.4, duration: 1.0)
        }
    }
}

extension OfferViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientQuantityTableViewCell", for: indexPath) as! IngredientQuantityTableViewCell
        cell.delegate = self
        cell.setIngredient(ingredients[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

extension OfferViewController: IngredientQuantityTableViewCellDelegate {
    func didIncreaseQuantity(_ ingredient: Ingredient) {
        if let selectedIngredient = ingredients.first(where: {$0.id == ingredient.id }), let specialOffer = specialOffer {
            specialOffer.offerPrice! += selectedIngredient.price!
            updatePrice()
        }
    }
    
    func didDecreaseQuantity(_ ingredient: Ingredient) {
        if let selectedIngredient = ingredients.first(where: { $0.id == ingredient.id }) , let specialOffer = specialOffer {
            if specialOffer.offerPrice! > selectedIngredient.price! {
                specialOffer.offerPrice! -= selectedIngredient.price!
                updatePrice()
            }
        }
    }
}
