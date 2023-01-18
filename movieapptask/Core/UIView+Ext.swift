//
//  UIView+Ext.swift
//  movieapptask
//
//  Created by Shady K. Maadawy on 15/01/2023.
//

import UIKit

extension UIView {
    
    func disableAutoResizingMask() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func enableAutoResizingMask() {
        self.translatesAutoresizingMaskIntoConstraints = true
    }
    
    func setCornerRadius(_ value: CGFloat = 6.00) {
        self.layer.cornerRadius = value
    }
    
    func setBorder(_ borderColor: UIColor = .separator) {
        self.layer.borderColor = borderColor.withAlphaComponent(0.75).cgColor
        self.layer.borderWidth = 2.00
    }
    
}

