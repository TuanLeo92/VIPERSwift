//
//  UIView+Extensions.swift
//  VIPERSwift
//
//  Created by Le Tuan on 30/7/19.
//  Copyright © 2019 Le Tuan. All rights reserved.
//

import Foundation
import UIKit

// MARK: - IBInspectables
extension UIView {
    
    @IBInspectable var radius: CGFloat {
        set {
            layer.cornerRadius = newValue
            clipsToBounds = true
        }
        
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor {
        set {
            layer.borderColor = newValue.cgColor
        }
        
        get {
            return UIColor(cgColor: layer.borderColor ?? UIColor.black.cgColor)
        }
    }
}

// MARK: - Shadow
extension UIView {
    func addShadow(offset: CGSize, color: UIColor, radius: CGFloat, opacity: Float) {
        removeShadow()
        layer.masksToBounds = false
        layer.shadowOffset = offset
        layer.shadowColor = color.cgColor
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        layer.shadowPath = UIBezierPath(roundedRect: layer.bounds, cornerRadius: layer.cornerRadius).cgPath
        
        let backgroundCGColor = backgroundColor?.cgColor
        backgroundColor = nil
        layer.backgroundColor = backgroundCGColor
    }
    
    func removeShadow() {
        layer.shadowOffset = CGSize(width: 0 , height: 0)
        layer.shadowColor = UIColor.clear.cgColor
        layer.shadowRadius = 0.0
        layer.shadowOpacity = 0.00
    }
}
