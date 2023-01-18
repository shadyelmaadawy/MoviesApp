//
//  SeparatorLine.swift
//  movieapptask
//
//  Created by Shady K. Maadawy on 17/01/2023.
//

import UIKit

final class SeparatorLine: BaseUIView {

    init(axis: NSLayoutConstraint.Axis = .horizontal) {
        super.init()
        self.setupSepratorLine(axis)
    }
    
    private func setupSepratorLine(_ axis: NSLayoutConstraint.Axis) {
        self.backgroundColor = .separator
        switch(axis) {
            case .horizontal:
                NSLayoutConstraint.activate([
                    self.widthAnchor.constraint(equalToConstant: 1.25)]
                )
            case .vertical:
                NSLayoutConstraint.activate([
                    self.heightAnchor.constraint(equalToConstant: 1.25),
                ])
        @unknown default:
            fatalError("?")
        }
    }

}
