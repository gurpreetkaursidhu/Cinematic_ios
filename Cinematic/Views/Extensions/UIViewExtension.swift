//
//  UIViewExtension.swift
//  Cinematic
//
//  Created by Gurpreet Kaur on 2022-12-16.
//

import UIKit

extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }

    
}
