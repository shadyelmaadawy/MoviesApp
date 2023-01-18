//
//  BaseCollectionViewCell.swift
//  movieapptask
//
//  Created by Shady K. Maadawy on 15/01/2023.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    
    /// Initialization of instance.
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupCollectionViewCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Setup cell for generic usage.
    private func setupCollectionViewCell() {
        self.backgroundColor = .systemGray5
    }
    
}
