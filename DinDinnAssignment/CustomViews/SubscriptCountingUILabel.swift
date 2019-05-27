//
//  SubscriptCountingUILabel.swift
//  DinDinnAssignment
//
//  Created by Duy Nguyen on 5/27/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit

class SubscriptCountingUILabel: SubscriptUILabel {
    var currentValue: Double = 0
    var newValue: Double = 0
    var animationStartDate = Date()
    var animationDuration = 1.5
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func setText(_ newText: String) {
        if !(newText.contains("$")) {
            super.setText(newText)
        } else {
            let displayLink = CADisplayLink(target: self, selector: #selector(handleUpdate))
            displayLink.add(to: .main, forMode: .default)
            animationStartDate = Date()
            if let text = text {
                let index = text.index(text.startIndex, offsetBy: 1)
                currentValue = Double(text.suffix(from: index))!
                newValue = Double(newText.suffix(from: index))!
            }
        }
    }
    
    @objc func handleUpdate(_ displayLink: CADisplayLink) {
        let now = Date()
        let elapseTime = now.timeIntervalSince(animationStartDate)
        
        if elapseTime > animationDuration {
            super.setText("$\(String(newValue))")
            displayLink.invalidate()
        } else {
            let percentage = elapseTime / animationDuration
            let value = currentValue + percentage * (newValue - currentValue)
            super.setText("$\(String(format:"%.2f",value))")
        }
    }
}
