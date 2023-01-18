//
//  BaseUIView.swift
//  movieapptask
//
//  Created by Shady K. Maadawy on 15/01/2023.
//

import UIKit

class BaseUIView: UIView {
    
    init() {
        super.init(frame: CGRect.zero)
        self.setupUIView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUIView() {
        self.disableAutoResizingMask()
    }
    
}

