//
//  HomeProtocols.swift
//  movieapptask
//
//  Created by Shady K. Maadawy on 16/01/2023.
//

import UIKit

protocol HomeViewProtocol: AnyObject {
    var presenter: HomePresenterProtocol! { get set }
    func popularMoviesFetchedSuccessfully(_ indexPaths: [IndexPath]?)
}
typealias HomeViewDelegates = HomeViewProtocol & BaseUIViewControllerDelegates

protocol HomePresenterProtocol: AnyObject {
    var view: HomeViewDelegates? { get set }
    var popularMoviesQuantity: Int { get }
    func notifyInteractor()
    func configureCell(with cell: HomeMovieCellView, for indexPath: IndexPath)
    func pushDetailsView(with index: IndexPath)
    
}

protocol HomeRouterProtocol: AnyObject {
    var viewController: UIViewController? { get set }
    func pushDetailsView(with movieIndex: Int)
}

protocol HomeInteractorInputProtocol: AnyObject {
    var presenter: HomeInteractorOutputProtocol? { get set }
    func getPopularMovies()
}

protocol HomeInteractorOutputProtocol: AnyObject {
    func popularMoviesFetchedSuccessfully(movies: [PopularMovieModel], isReachEnd: Bool)
    func popularMoviesFetchedFailed(withError baseError: Error)
}

protocol HomeMovieCellView: AnyObject {
    func configure(with viewModel: PopularMovieCellViewModel)
}
