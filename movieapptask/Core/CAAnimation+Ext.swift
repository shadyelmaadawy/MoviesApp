//
//  CAAnimation+Ext.swift
//  movieapptask
//
//  Created by Shady K. Maadawy on 16/01/2023.
//

import UIKit

extension CAAnimation {
    
    class var fadeAnimation: CATransition {
        let baseAnimation = CATransition()
        baseAnimation.duration = 0.3
        baseAnimation.type = .fade
        return baseAnimation
    }
    
    class var fadeInOutAnimation: CAKeyframeAnimation {
        let baseAnimation = CAKeyframeAnimation()
        baseAnimation.duration = 1.25
        baseAnimation.autoreverses = true
        baseAnimation.values = [1.0, 0.8, 0.6, 0.4, 0.2, 0.1]
        baseAnimation.fillMode = CAMediaTimingFillMode.both
        baseAnimation.repeatCount = .greatestFiniteMagnitude
        return baseAnimation
    }

}
