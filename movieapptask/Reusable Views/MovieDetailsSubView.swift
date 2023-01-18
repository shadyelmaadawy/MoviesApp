//
//  MovieDetailsSubView.swift
//  movieapptask
//
//  Created by Shady K. Maadawy on 17/01/2023.
//

import UIKit

final class MovieDetailsSubView: BaseUIView {
    
    private var typeOfDetailsImageView: BaseUIImageView = {
        let baseImageView = BaseUIImageView()
        baseImageView.contentMode = .center
        return baseImageView
    }()
    
    private var infoOfDetailsLabel: BaseUILabel = {
        let baseLabel = BaseUILabel()
        baseLabel.numberOfLines = 0
        baseLabel.textAlignment = .center
        return baseLabel
    }()
    
    override init() {
        super.init()
        self.setupSubView()
    }
    
    private func setupSubView() {
        self.backgroundColor = .clear
        self.layoutView()
    }
    
}

extension MovieDetailsSubView {
    
    private func layoutView() {
        setupDetailsImageView()
        setupDetailsLabel()
    }
    
    private func setupDetailsImageView() {
        
        self.addSubview(typeOfDetailsImageView)
        let detailsImageViewConstraints = [
            typeOfDetailsImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            typeOfDetailsImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            typeOfDetailsImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ]
        NSLayoutConstraint.activate(detailsImageViewConstraints)
        
    }
    
    private func setupDetailsLabel() {
        
        self.addSubview(infoOfDetailsLabel)
        let detialsLabelConstraints = [
            infoOfDetailsLabel.topAnchor.constraint(equalTo: self.typeOfDetailsImageView.bottomAnchor, constant: 5),
            infoOfDetailsLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            infoOfDetailsLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            infoOfDetailsLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ]
        NSLayoutConstraint.activate(detialsLabelConstraints)
    }
    
}

extension MovieDetailsSubView {
    
    func setImage(_ baseImageName: UIImage.baseImageNames, imageColor: UIColor) {
        self.typeOfDetailsImageView.image = .createBaseImage(baseImageName, color: imageColor)
    }
    
    func setDetailsTitle(_ message: NSAttributedString) {
        self.infoOfDetailsLabel.attributedText = message
    }
    
}
