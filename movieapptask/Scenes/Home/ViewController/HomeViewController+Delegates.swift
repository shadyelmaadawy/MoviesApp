//
//  HomeViewController+Delegates.swift
//  movieapptask
//
//  Created by Shady K. Maadawy on 16/01/2023.
//

import Foundation

extension HomeViewController: HomeViewProtocol {
    
    func popularMoviesFetchedSuccessfully() {
        self.popularMoviesCollectionView.reloadData()
        self.popularMoviesCollectionView.stopAnimating()
    }
    
}
