//
//  SpringUIView.swift
//  DinDinnAssignment
//
//  Created by Duy Nguyen on 5/27/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit

@IBDesignable
class SpringUIView: CornerUIVIew {

    func bounce(duration: CGFloat, scale: CGFloat, springDamping: CGFloat = 0.5, initialSpringVelocity: CGFloat = 2.0, completion: ((Bool) -> Void)?) {
        self.transform = CGAffineTransform(scaleX: scale, y: scale)
        UIView.animate(withDuration: TimeInterval(duration),
                       delay: 0,
                       usingSpringWithDamping: springDamping,
                       initialSpringVelocity: initialSpringVelocity,
                       options: .allowUserInteraction,
                       animations: {
                        self.transform = CGAffineTransform.identity
        }, completion: { completed in
            if let completion = completion {
                completion(completed)
            }
        })        
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
}
