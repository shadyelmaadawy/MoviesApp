//
//  UIImage+Ext.swift
//  movieapptask
//
//  Created by Shady K. Maadawy on 15/01/2023.
//

import UIKit

extension UIImage {
    
    enum baseImageNames: String {
        case rating = "star.fill"
        case date = "clock.fill"
        case count = "person.fill"
        case error = "exclamationmark.triangle.fill"
    }
    
    class func createBaseImage(_ baseName: baseImageNames, color: UIColor = .systemBlue) -> UIImage {
        guard let baseImage = UIImage(systemName: baseName.rawValue) else {
            fatalError("Cannot found image")
        }
        return baseImage.withTintColor(color, renderingMode: .alwaysOriginal)
    }

}
