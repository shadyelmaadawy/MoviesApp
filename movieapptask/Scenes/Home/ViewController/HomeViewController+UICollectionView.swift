//
//  HomeViewController+UICollectionView.swift
//  movieapptask
//
//  Created by Shady K. Maadawy on 16/01/2023.
//

import UIKit

extension HomeViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.presenter.pushDetailsView(with: indexPath)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if((scrollView.contentOffset.y + scrollView.frame.size.height) > ((scrollView.contentSize.height / 10) * 9.5)) {
            self.presenter.notifyInteractor()
        }
    }
    
}

extension HomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let baseCell = collectionView.dequeue(for: indexPath) as MovieCollectionViewCell
        presenter.configureCell(with: baseCell, for: indexPath)
        return baseCell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.popularMoviesQuantity
    }
}

