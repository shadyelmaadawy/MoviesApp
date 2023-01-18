//
//  LoadingIndicator.swift
//  movieapptask
//
//  Created by Shady K. Maadawy on 16/01/2023.
//

import UIKit

final class LoadingIndicator: UIActivityIndicatorView {
    
    init() {
        super.init(frame: CGRect.zero)
        setupIndicator()
    }
    
    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupIndicator() {
        self.style = .medium
        self.backgroundColor = .clear
        self.startAnimating()
        self.disableAutoResizingMask()
    }
}
