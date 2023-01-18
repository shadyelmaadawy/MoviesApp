//
//  UICollectionView+Ext.swift
//  movieapptask
//
//  Created by Shady K. Maadawy on 15/01/2023.
//

import UIKit

extension UICollectionView {
    
    /// Register collection view cell
    /// - Parameter cellType: Type of collectionView cell
    func register(_ cellType: UICollectionViewCell.Type) {
        let baseName: String = cellType.reuseableIdentifier
        self.register(cellType, forCellWithReuseIdentifier: baseName)
    }
    
    /// Dequeue collection view cell with type
    /// - Parameter indexPath: index path of cell
    /// - Returns: Required Cell
    func dequeue<RequiredCollectionViewCell: UICollectionViewCell>(for indexPath: IndexPath) -> RequiredCollectionViewCell {
        let baseName: String = RequiredCollectionViewCell.reuseableIdentifier
        guard let baseCell = self.dequeueReusableCell(withReuseIdentifier: baseName, for: indexPath) as? RequiredCollectionViewCell else {
            fatalError("Cannot Deqeue Cell!")
        }
        return baseCell
    }

    var loadingIndicator: LoadingIndicator {
        guard let indicator = self.backgroundView as? LoadingIndicator else {
            fatalError("Background view is not loading indicator view.")
        }
        return indicator
    }
    
    /// Create Collection View Layout
    /// - Parameter perRow: Numbers of rows per column, minumum is 2
    /// - Returns: Created layout
    class func createCollectionLayout(_ perRow: Int = 2) -> UICollectionViewCompositionalLayout {
        
        let perRow: CGFloat = 1.0/CGFloat(perRow) // casting rows from int32 to cgfloat

        //Item Size
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(perRow),
            heightDimension: .fractionalHeight(1.0)
        )

        // Item Padding
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(
            top: 7.5, leading: 7.5,
            bottom: 5.0, trailing: 7.5
        )

        // Row Size
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalWidth(perRow)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        // Section Size
        let section = NSCollectionLayoutSection(group: group)
        return UICollectionViewCompositionalLayout(section: section)
    }

}
