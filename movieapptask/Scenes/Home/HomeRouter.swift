//
//  HomeRouter.swift
//  movieapptask
//
//  Created by Shady K. Maadawy on 16/01/2023.
//

import UIKit

final class HomeRouter: HomeRouterProtocol {
    weak var viewController: UIViewController?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func pushDetailsView(with movieIndex: Int) {
        let baseViewController = DetailsConfigrator.createDetailsVC(with: movieIndex)
        self.viewController?.navigationController?.pushViewController(baseViewController, animated: true)
    }

}

