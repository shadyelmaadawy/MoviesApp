//
//  MovieDetailsView.swift
//  movieapptask
//
//  Created by Shady K. Maadawy on 15/01/2023.
//

import UIKit

final class MovieDetailsView: BaseUIView {
    
    // MARK: - UI Components

    private var starImageView: BaseUIImageView = {
        let baseImageView = BaseUIImageView()
        baseImageView.image = .createBaseImage(.rating, color: .systemYellow)
        baseImageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return baseImageView
    }()
    
    private var movieRatingUILabel: BaseUILabel = {
        let baseLabel = BaseUILabel(style: .secondary)
        baseLabel.textColor = .white
        baseLabel.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return baseLabel
    }()
    
    /// Initialization of instance.
    override init() {
        super.init()
        self.setupView()
    }
    
    /// Setup view, for generic usage.
    private func setupView() {
        self.backgroundColor = .black.withAlphaComponent(0.75)
        self.layoutView()
    }
    
}


// MARK: - Layout sub view
extension MovieDetailsView {
    
    private func layoutView() {
        setupStarImageView()
        setupRatingUILabel()
    }
    
    private func setupStarImageView() {
        
        self.addSubview(starImageView)
        let starImageViewConstraitns = [
            starImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            starImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            starImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
        ]
        NSLayoutConstraint.activate(starImageViewConstraitns)

    }
    
    private func setupRatingUILabel() {
        self.addSubview(movieRatingUILabel)
        let movieRatingLabelConstraints = [
            movieRatingUILabel.topAnchor.constraint(greaterThanOrEqualTo: self.topAnchor, constant: 5),
            movieRatingUILabel.bottomAnchor.constraint(greaterThanOrEqualTo: self.bottomAnchor, constant: -5),
            movieRatingUILabel.centerYAnchor.constraint(equalTo: self.starImageView.centerYAnchor),
            movieRatingUILabel.leadingAnchor.constraint(equalTo: self.starImageView.trailingAnchor, constant: 2.5),
            movieRatingUILabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
        ]
        NSLayoutConstraint.activate(movieRatingLabelConstraints)
    }
    
}

extension MovieDetailsView {
    
    func setRating(_ rate: String) {
        self.movieRatingUILabel.text = rate
    }
    
}
