//
//  HomeViewConfigrator.swift
//  movieapptask
//
//  Created by Shady K. Maadawy on 16/01/2023.
//

import UIKit

final class HomeViewConfigrator {
    
    class func createHomeVC() -> UIViewController {
        let baseViewController = HomeViewController(viewPriority: .main)
        baseViewController.setTitle(.home)
        let baseRouter = HomeRouter(viewController: baseViewController)
        let baseInteractor = HomeInteractor()
        let basePresenter = HomePresenter(view: baseViewController, router: baseRouter, interactor: baseInteractor)
        baseInteractor.presenter = basePresenter
        baseViewController.presenter = basePresenter
        return baseViewController
    }
    
}
