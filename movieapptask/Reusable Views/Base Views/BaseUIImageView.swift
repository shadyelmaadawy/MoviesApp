//
//  BaseUIImageView.swift
//  movieapptask
//
//  Created by Shady K. Maadawy on 15/01/2023.
//

import UIKit

class BaseUIImageView: UIImageView {
    
    init(disableAutoRizingMask: Bool = true) {
        super.init(frame: CGRect.zero)
        self.setupUIImageView(disableAutoRizingMask)
    }
    
    convenience init(image: UIImage) {
        self.init()
        self.image = image
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUIImageView(_ disableAutoRizingMask: Bool) {
        if(disableAutoRizingMask) {
            self.disableAutoResizingMask()
        }
        self.clipsToBounds = true
    }
}

extension BaseUIImageView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setCornerRadius(4.00)

    }
}

