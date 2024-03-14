//
//  UIView+Ext.swift
//  RickAndMorty
//
//  Created by Ferhat on 28.01.2024.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
}

    

