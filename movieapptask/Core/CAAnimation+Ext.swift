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

}
