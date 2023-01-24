//
//  HomeViewController.swift
//  movieapptask
//
//  Created by Shady K. Maadawy on 15/01/2023.
//

import UIKit

final class HomeViewController: BaseUIViewController {
    
    // MARK: - Properties
    
    var presenter: HomePresenterProtocol! {
        didSet {
            presenter.notifyInteractor()
        }
    }

    // MARK: - UI Components
    
    private(set) lazy var popularMoviesCollectionView: BaseUICollectionView = {
        let baseCollectionView = BaseUICollectionView(perRow: 2)
        baseCollectionView.isPagingEnabled = true
        baseCollectionView.register(MovieCollectionViewCell.self)
        baseCollectionView.setDelegates(self)
        baseCollectionView.setDataSource(self)
        return baseCollectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.layoutView()
    }
    
}

//MARK: - Layout sub views

extension HomeViewController {
    
    private func layoutView() {
        setupMoviesCollectionView()
    }
    
    private func setupMoviesCollectionView() {
        
        self.view.addSubview(popularMoviesCollectionView)
        let popularMoviesCollectionViewConstraints = [
            popularMoviesCollectionView.topAnchor.constraint(equalTo: self.safeArea.topAnchor),
            popularMoviesCollectionView.bottomAnchor.constraint(equalTo: self.safeArea.bottomAnchor),
            popularMoviesCollectionView.leadingAnchor.constraint(equalTo: self.safeArea.leadingAnchor, constant: 5),
            popularMoviesCollectionView.trailingAnchor.constraint(equalTo: self.safeArea.trailingAnchor, constant: -5)
        ]
        NSLayoutConstraint.activate(popularMoviesCollectionViewConstraints)
        
    }
    
}

