//
//  IngredientCircularView.swift
//  DinDinnAssignment
//
//  Created by Duy Nguyen on 5/27/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit
import CoreGraphics

class IngredientCircularView: UIView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        let trackLayer = CAShapeLayer()
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: rect.width/2, y: rect.height/2), radius: rect.width/2, startAngle: -CGFloat.pi / 2, endAngle: CGFloat.pi * 2, clockwise: true)
        trackLayer.path = circularPath.cgPath
        trackLayer.strokeColor = UIColor.lightGray.cgColor
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineWidth = 3
        
        layer.addSublayer(trackLayer)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.name = "shapeLayer"
        shapeLayer.path = circularPath.cgPath
        shapeLayer.strokeColor = UIColor(red: 255.0/255.0, green: 218.0/255.0, blue: 2.0/255.0, alpha: 1.0).cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 3
        shapeLayer.strokeEnd = 0
        shapeLayer.lineCap = CAShapeLayerLineCap.round
        
        layer.addSublayer(shapeLayer)
    }
 
    func animateShapeLayer(duration: Int) {
        let shapeLayer = self.layer.sublayers?.first{ $0.name == "shapeLayer" }
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 1
        animation.duration = CFTimeInterval(duration)
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        
        shapeLayer?.add(animation, forKey: "fillShape")
    }
}
