//
//  HomeViewController+Delegates.swift
//  movieapptask
//
//  Created by Shady K. Maadawy on 16/01/2023.
//

import Foundation

extension HomeViewController: HomeViewProtocol {
    
    func popularMoviesFetchedSuccessfully(_ indexPaths: [IndexPath]?) {
        self.popularMoviesCollectionView.stopAnimating()
        guard let indexPaths = indexPaths else {
            self.popularMoviesCollectionView.reloadData()
            return
        }
        self.popularMoviesCollectionView.performBatchUpdates { [ weak self] in
            guard let self = self else { return }
            self.popularMoviesCollectionView.insertItems(at: indexPaths)
        }
    }
    
}
