//
//  HomePresenter.swift
//  movieapptask
//
//  Created by Shady K. Maadawy on 16/01/2023.
//

import Foundation

final class HomePresenter: HomePresenterProtocol, HomeInteractorOutputProtocol {

    weak var view: HomeViewDelegates?
    private var router: HomeRouterProtocol
    private var interactor: HomeInteractorInputProtocol
    
    private var popularMovies: [PopularMovieModel] = {
        var basePopularMovies = [PopularMovieModel].init()
        basePopularMovies.reserveCapacity(64)
        return basePopularMovies
    }()
    
    var popularMoviesQuantity: Int {
        return popularMovies.count
    }
    
    private var popularMoviesIsFetching: Bool = false
    
    private var popularMoviesIsReachEnd: Bool = false    
    
    init(view: HomeViewDelegates, router: HomeRouter, interactor: HomeInteractorInputProtocol) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
}

// MARK: - Popular Movies

extension HomePresenter {
    
    func notifyInteractor() {
        guard popularMoviesIsFetching == false else {
            return
        }
        if popularMoviesIsReachEnd == false {
            popularMoviesIsFetching.toggle()
            interactor.getPopularMovies()
        }
    }
    
    func popularMoviesFetchedSuccessfully( movies: [PopularMovieModel], isReachEnd: Bool) {
        self.popularMovies.append(contentsOf: movies)
        DispatchQueue.main.async {
            self.popularMoviesIsFetching.toggle()
            self.view?.popularMoviesFetchedSuccessfully()
        }
    }
    
    func popularMoviesFetchedFailed(withError baseError: Error) {
        DispatchQueue.main.async {
            self.view?.showError(withError: baseError, dismissView: false)
        }
    }
    
    func pushDetailsView(with index: IndexPath) {
        let movieModel = self.popularMovies[index.row]
        self.router.pushDetailsView(with: movieModel.id)
    }

    func configureCell(with cell: HomeMovieCellView, for indexPath: IndexPath) {
        let movieModel = self.popularMovies[indexPath.row]
        let movieViewModel = PopularMovieCellViewModel(with: movieModel)
        cell.configure(with: movieViewModel)
    }

}
