//
//  DetailsInteractor.swift
//  movieapptask
//
//  Created by Shady K. Maadawy on 17/01/2023.
//

import Foundation

final class DetailsInteractor: DetailsInteractorInputProtocol {
    
    weak var presenter: DetailsInteractorOutputProtocol?
    
    private let worker = DetailsWorker()
    
    func getDetails(with movieIndex: Int) {
        
        worker.getMovieDetails(movieIndex) { [weak presenter] fetchResult in
            guard let presenter = presenter else { return }
            switch(fetchResult) {
                case .success(let movieModel):
                    presenter.movieDetailsFetchedSuccessfully(with: movieModel)
                case .failure(let networkError):
                    presenter.movieDetailsFetchedFailed(withError: networkError)
            }
        }
    }
    
}

