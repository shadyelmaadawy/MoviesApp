//
//  NSObject+Ext.swift
//  movieapptask
//
//  Created by Shady K. Maadawy on 16/01/2023.
//

import Foundation

extension NSObject {
    
    /// A variable to get string identifier across all objects
    /// As an example: views, controllers, labels.. etc
    /// Example of usage, Self.reuseableIdentifier
    class var reuseableIdentifier: String {
        return String(describing: self)
    }

}
