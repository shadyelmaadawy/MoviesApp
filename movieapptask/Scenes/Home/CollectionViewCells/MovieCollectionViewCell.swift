//
//  MovieCollectionViewCell.swift
//  movieapptask
//
//  Created by Shady K. Maadawy on 15/01/2023.
//

import UIKit

final class MovieCollectionViewCell: BaseCollectionViewCell {
    
    // MARK: - UI Components
    
    private var movieImageView: URLImageView = {
        let baseImageView = URLImageView()
        baseImageView.contentMode = .scaleToFill
        baseImageView.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        return baseImageView
    }()
    
    private var movieDetailsView: MovieDetailsView = {
        let baseView = MovieDetailsView()
        return baseView
    }()
    
    private var movieTitle: BaseUILabel = {
        let baseLabel = BaseUILabel()
        baseLabel.textAlignment = .center
        baseLabel.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        return baseLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupCell()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        self.layoutView()
    }
    
}

extension MovieCollectionViewCell {
    
    override func prepareForReuse() {
        self.movieTitle.text = ""
        self.movieImageView.cancelDownloadTask()
        self.movieDetailsView.setRating("")
        super.prepareForReuse()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setCornerRadius()
    }
}

extension MovieCollectionViewCell {
    
    private func layoutView() {
        setupMovieImageView()
        setupMovieDetailsView()
        setupMovieTitle()
    }
    
    private func setupMovieImageView() {
        
        self.contentView.addSubview(movieImageView)
        let movieImageViewConstraints = [
            movieImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            movieImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            movieImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
        ]
        NSLayoutConstraint.activate(movieImageViewConstraints)
    }
    
    private func setupMovieDetailsView() {
        
        self.movieImageView.addSubview(movieDetailsView)
        let movieDetailsConstraints = [
            movieDetailsView.topAnchor.constraint(greaterThanOrEqualTo: self.movieImageView.topAnchor, constant: 5),
            movieDetailsView.bottomAnchor.constraint(equalTo: self.movieImageView.bottomAnchor),
            movieDetailsView.leadingAnchor.constraint(equalTo: self.movieImageView.leadingAnchor),
            movieDetailsView.trailingAnchor.constraint(equalTo: self.movieImageView.trailingAnchor)
        ]
        NSLayoutConstraint.activate(movieDetailsConstraints)
        
    }
    
    private func setupMovieTitle() {

        self.contentView.addSubview(movieTitle)
        let movieTitleConstraints = [
            movieTitle.topAnchor.constraint(equalTo: self.movieImageView.bottomAnchor, constant: 5),
            movieTitle.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            movieTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            movieTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5)
        ]
        NSLayoutConstraint.activate(movieTitleConstraints)

    }
    
}

extension MovieCollectionViewCell: HomeMovieCellView {
    
    func configure(with viewModel: PopularMovieCellViewModel) {
        self.movieTitle.text = viewModel.title
        self.movieImageView.downloadImage(with: viewModel.posterPath)
        self.movieDetailsView.setRating(viewModel.rate)
    }
}
