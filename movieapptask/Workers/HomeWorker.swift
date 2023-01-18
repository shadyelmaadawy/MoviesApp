//
//  HomeWorker.swift
//  movieapptask
//
//  Created by Shady K. Maadawy on 16/01/2023.
//

import Foundation

final class HomeWorker {
    
    private let engine = NetworkEngine()
    
    private var currnetPage: Int = 1
    
    func getPopularMovies(handler: @escaping(Result<([PopularMovieModel], Bool), Error>) -> ()) {
        self.engine.get(endPoint: PopularMoviesEndPoint.init(currnetPage), as: PopularMoviesResult.self) { [weak self] moviesRequest in
            guard let self = self else { return }
            switch(moviesRequest) {
                case .success(let moviesResult):
                    let isReachEnd = (moviesResult.totalPages - self.currnetPage) == 0
                    self.currnetPage += 1
                    handler(.success((moviesResult.movies, isReachEnd)))
                case .failure(let networkError):
                    handler(.failure(networkError))
            }
        }
    }
    
}
