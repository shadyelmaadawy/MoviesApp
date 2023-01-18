//
//  BaseUIStackView.swift
//  movieapptask
//
//  Created by Shady K. Maadawy on 17/01/2023.
//

import UIKit

class BaseUIStackView: UIStackView {
    
    init() {
        super.init(frame: CGRect.zero)
        self.setupStackView()
    }
    
    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupStackView() {
        self.disableAutoResizingMask()
        self.backgroundColor = .clear
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setCornerRadius()
        self.setBorder()
    }
    
    override func addArrangedSubview(_ view: UIView) {
        super.addArrangedSubview(view)
        if(view.isKind(of: SeparatorLine.self) == false && self.arrangedSubviews.count > 0) {
            self.addArrangedSubview(SeparatorLine(axis: self.axis))
        }

    }
}


