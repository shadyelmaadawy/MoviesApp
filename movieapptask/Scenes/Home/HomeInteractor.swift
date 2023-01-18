//
//  HomeInteractor.swift
//  movieapptask
//
//  Created by Shady K. Maadawy on 16/01/2023.
//

import Foundation

final class HomeInteractor: HomeInteractorInputProtocol {
    
    weak var presenter: HomeInteractorOutputProtocol?
    
    private let homeWorker = HomeWorker()
    
    func getPopularMovies() {
        homeWorker.getPopularMovies { [weak presenter] fetchResult in
            guard let presenter = presenter else { return }
            switch(fetchResult) {
                case .success((let movies, let isReachEnd)):
                    presenter.popularMoviesFetchedSuccessfully(
                        movies: movies, isReachEnd: isReachEnd
                    )
                case .failure(let fetchError):
                    presenter.popularMoviesFetchedFailed(withError: fetchError)
            }
        }
        
    }
    
}
