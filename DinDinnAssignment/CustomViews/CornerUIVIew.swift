//
//  CornerUIVIew.swift
//  DinDinnAssignment
//
//  Created by Duy Nguyen on 5/27/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit

class CornerUIVIew: UIView {

    @IBInspectable
    var cornerRadius: CGFloat = 0.0
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = cornerRadius
    }

}
