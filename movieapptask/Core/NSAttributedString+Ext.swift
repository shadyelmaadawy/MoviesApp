//
//  NSAttributedString+Ext.swift
//  movieapptask
//
//  Created by Shady K. Maadawy on 17/01/2023.
//

import Foundation

extension NSAttributedString {
    
    class func createBaseAttributedString(
        _ message: String..., attributes: [NSAttributedString.Key: Any]...) -> NSMutableAttributedString {
            if message.count != attributes.count || message.count == 0 {
                fatalError("Messages length are not equal to attributes!")
            }
            let baseMutableString = NSMutableAttributedString()
            for (index, value) in message.enumerated() {
                let attribute = attributes[index]
                baseMutableString.append(NSAttributedString(string: value, attributes: attribute))
            }
            return baseMutableString
    }
    
}

