//
//  BaseUIScrollView.swift
//  movieapptask
//
//  Created by Shady K. Maadawy on 17/01/2023.
//

import UIKit

final class BaseUIScrollView: UIScrollView {
    init(disableAutoRizingMask: Bool = true) {
        super.init(frame: CGRect.zero)
        setupScrollView(disableAutoRizingMask)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    private func setupScrollView(_ disableAutoRizingMask: Bool) {
        if(disableAutoRizingMask) {
            self.disableAutoResizingMask()
        }
        self.backgroundColor = .clear
    }
    
}
