//
//  DetailsViewController.swift
//  movieapptask
//
//  Created by Shady K. Maadawy on 17/01/2023.
//

import UIKit


final class DetailsViewController: BaseUIViewController {
    
    var presenter: DetailsPresenterProtocol! {
        didSet {
            presenter.notifyInteractor()
        }
    }

   // MARK: - UI Components
    
    private var movieImageView: URLImageView = {
        let baseImageView = URLImageView()
        baseImageView.contentMode = .scaleToFill
        return baseImageView
    }()
    
    private var loadingIndicator: LoadingIndicator = {
        let baseIndicator = LoadingIndicator()
        baseIndicator.startAnimating()
        return baseIndicator
    }()
    
    private var releaseDateSubView: MovieDetailsSubView = {
        let baseView = MovieDetailsSubView()
        baseView.setImage(.date, imageColor: .label)
        return baseView
    }()
    
    private var voteAverageSubView: MovieDetailsSubView = {
        let baseView = MovieDetailsSubView()
        baseView.setImage(.rating, imageColor: .systemYellow)
        return baseView
    }()

    private var voteCountSubView: MovieDetailsSubView = {
        let baseView = MovieDetailsSubView()
        baseView.setImage(.count, imageColor: .systemGray)
        return baseView
    }()

    private lazy var detailsStackView: BaseUIStackView = {
        let baseStackView = BaseUIStackView()
        baseStackView.axis = .horizontal
        baseStackView.distribution = .fillProportionally
        baseStackView.alignment = .fill
        baseStackView.addArrangedSubview(self.releaseDateSubView)
        baseStackView.addArrangedSubview(self.voteAverageSubView)
        baseStackView.addArrangedSubview(self.voteCountSubView)
        return baseStackView
    }()
    
    private var overViewLabel: BaseUILabel = {
        let baseLabel = BaseUILabel()
        baseLabel.numberOfLines = 0
        return baseLabel
    }()

    override func loadView() {
        self.view = BaseUIScrollView(disableAutoRizingMask: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutView()
    }
    
}

extension DetailsViewController {
    
    private func layoutView() {
        self.view.addSubview(loadingIndicator)
        let loadingIndicatorConstraints = [
            loadingIndicator.centerYAnchor.constraint(equalTo: self.safeArea.centerYAnchor),
            loadingIndicator.centerXAnchor.constraint(equalTo: self.safeArea.centerXAnchor)
        ]
        NSLayoutConstraint.activate(loadingIndicatorConstraints)
    }
 
    func layoutSubView() {
        self.view.subviews.forEach { view in
            view.removeFromSuperview()
        }
        setupMovieImageView()
        setupDetailsStackView()
        setupOverViewLabel()
    }

    private func setupMovieImageView() {
        
        self.view.addSubview(movieImageView)
        let movieImageViewConstraints = [
            movieImageView.topAnchor.constraint(equalTo: self.safeArea.topAnchor, constant: 10),
            movieImageView.leadingAnchor.constraint(equalTo: self.safeArea.leadingAnchor, constant: 10),
            movieImageView.trailingAnchor.constraint(equalTo: self.safeArea.trailingAnchor, constant: -10),
            movieImageView.heightAnchor.constraint(equalTo: self.movieImageView.widthAnchor, multiplier: 0.5)
        ]
        NSLayoutConstraint.activate(movieImageViewConstraints)
    }

    private func setupDetailsStackView() {
        
        self.view.addSubview(detailsStackView)
        let detailsStackViewConstraints = [
            detailsStackView.topAnchor.constraint(equalTo: self.movieImageView.bottomAnchor, constant: 10),
            detailsStackView.leadingAnchor.constraint(equalTo: self.safeArea.leadingAnchor, constant: 10),
            detailsStackView.trailingAnchor.constraint(equalTo: self.safeArea.trailingAnchor, constant: -10),
        ]
        NSLayoutConstraint.activate(detailsStackViewConstraints)
        
    }
    
    private func setupOverViewLabel() {
        
        self.view.addSubview(overViewLabel)
        let overViewLabelConstraints = [
            overViewLabel.topAnchor.constraint(equalTo: self.detailsStackView.bottomAnchor, constant: 10),
            overViewLabel.bottomAnchor.constraint(lessThanOrEqualTo: self.safeArea.bottomAnchor, constant: -15),
            overViewLabel.leadingAnchor.constraint(equalTo: self.safeArea.leadingAnchor, constant: 15),
            overViewLabel.trailingAnchor.constraint(equalTo: self.safeArea.trailingAnchor, constant: -15)
        ]
        NSLayoutConstraint.activate(overViewLabelConstraints)
        
    }
    
}

extension DetailsViewController: DetailsViewProtocol {

    func setImagePath(with posterPath: String) {
        self.movieImageView.downloadImage(with: posterPath)
    }
    
    func setOverview(_ message: NSAttributedString) {
        self.overViewLabel.attributedText = message
    }
    
    func setReleaseDate(_ date: NSAttributedString) {
        self.releaseDateSubView.setDetailsTitle(date)
    }
    
    func setAverageRate(_ rate: NSAttributedString) {
        self.voteAverageSubView.setDetailsTitle(rate)
    }
    
    func setVoteCount(_ count: NSAttributedString) {
        self.voteCountSubView.setDetailsTitle(count)
    }

}
