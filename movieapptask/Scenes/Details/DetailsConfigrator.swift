//
//  DetailsConfigrator.swift
//  movieapptask
//
//  Created by Shady K. Maadawy on 17/01/2023.
//

import UIKit

final class DetailsConfigrator {
 
    class func createDetailsVC(with movieIndex: Int) -> UIViewController {
        let baseViewController = DetailsViewController(viewPriority: .secondary)
        baseViewController.setTitle(.details)
        let baseInteractor = DetailsInteractor()
        let basePresnter = DetailsPresenter(view: baseViewController, interactor: baseInteractor, movieIndex)
        baseInteractor.presenter = basePresnter
        baseViewController.presenter = basePresnter
        return baseViewController
    }
    
}
