//
//  BaseUICollectionView.swift
//  movieapptask
//
//  Created by Shady K. Maadawy on 15/01/2023.
//

import UIKit

final class BaseUICollectionView: UICollectionView {
            
    // MARK: - Enums
    
    enum collectionViewErrorCodes: LocalizedError {
        
        case minimumRowsPerRow
        
        var errorDescription: String? {
            switch(self) {
                case .minimumRowsPerRow:
                    return "Minimum cells per row must be equal or greater than 2"
            }
        }
    }
    
    /// Initialization of instance.
    init(perRow: Int = 2) {
        if perRow < 2 { fatalError(collectionViewErrorCodes.minimumRowsPerRow.localizedDescription) }
        super.init(frame: CGRect.zero, collectionViewLayout: Self.createCollectionLayout(perRow))
        self.setupCollectionView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Setup collection view, for generic usage.
    private func setupCollectionView() {
        self.disableAutoResizingMask()
        self.backgroundView = LoadingIndicator()
        self.backgroundColor = .collectionViewColor
    }
    
    func startAnimating() {
        loadingIndicator.isAnimating ? nil : loadingIndicator.startAnimating()
    }
    
    func stopAnimating() {
        loadingIndicator.isAnimating ? loadingIndicator.stopAnimating() : nil
    }
}

// MARK: - Helper functions
extension BaseUICollectionView {
    
    /// Setup delegates of collection view
    /// - Parameter delegates: an instance of class confirming to collectionview delegates protocol
    func setDelegates(_ delegates: UICollectionViewDelegate) {
        self.delegate = delegates
    }
    
    /// Setup data source of collection view
    /// - Parameter dataSource: an instance of class confirming to collection view data sourcec protocol
    func setDataSource(_ dataSource: UICollectionViewDataSource) {
        self.dataSource = dataSource
    }
}

// MARK: - UI Refresh Controller

extension BaseUICollectionView {
    
    func stopRefresh() {
        self.refreshControl?.endRefreshing()
    }
    
    func startRefresh() {
        self.refreshControl?.beginRefreshing()
    }
}
