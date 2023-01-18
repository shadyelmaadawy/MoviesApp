//
//  DetailsWorker.swift
//  movieapptask
//
//  Created by Shady K. Maadawy on 17/01/2023.
//

import Foundation

final class DetailsWorker {
    
    private let engine = NetworkEngine()
    
    func getMovieDetails(_ movieIndex: Int, handler: @escaping(Result<MovieDetailsModel, Error>) -> ()) {
        self.engine.get(endPoint: MovieDetailsEndPoint.init(movieIndex) , as: MovieDetailsModel.self, handler: handler)
    }
    
    
}
