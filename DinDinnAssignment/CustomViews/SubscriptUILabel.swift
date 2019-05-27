//
//  SubscriptUILabel.swift
//  DinDinnAssignment
//
//  Created by Duy Nguyen on 5/27/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit
@IBDesignable
class SubscriptUILabel: UILabel {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    @IBInspectable
    var subscriptFontSize: CGFloat = 25.0
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setText(text!)
    }
    
    func setText(_ text: String) {
        if (text.contains(".")) {
            let attributedString = NSMutableAttributedString(string: text)
            if let startLocation  = text.firstIndex(of: ".") {
                let range = NSRange(location: Int(startLocation.encodedOffset)+1, length: text.count - Int(startLocation.encodedOffset)-1)
                let subscriptFont = UIFont.boldSystemFont(ofSize: subscriptFontSize)
                attributedString.setAttributes([NSAttributedString.Key.baselineOffset: 10, NSMutableAttributedString.Key.font: subscriptFont], range: range)
                self.attributedText = attributedString
            } else {
                self.text = text
            }
        } else {
            self.text = text
        }
    }
}
