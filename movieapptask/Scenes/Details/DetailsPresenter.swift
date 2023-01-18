//
//  DetailsPresenter.swift
//  movieapptask
//
//  Created by Shady K. Maadawy on 17/01/2023.
//

import Foundation

final class DetailsPresenter: DetailsPresenterProtocol, DetailsInteractorOutputProtocol{
    weak var view: DetailsViewDelegates?
    private let interactor: DetailsInteractorInputProtocol
    private let movieIndex: Int
    init(view: DetailsViewDelegates, interactor: DetailsInteractorInputProtocol, _ movieIndex: Int) {
        self.view = view
        self.interactor = interactor
        self.movieIndex = movieIndex
    }
    
    func notifyInteractor() {
        interactor.getDetails(with: movieIndex)
    }
    
    func movieDetailsFetchedSuccessfully(with movieModel: MovieDetailsModel) {
        let movieViewModel = MovieDetailsViewModel(with: movieModel)
        self.view?.setImagePath(with: movieViewModel.posterPath)
        DispatchQueue.main.async {
            self.view?.layoutSubView()
            self.view?.setTitle(movieViewModel.title)
            self.view?.setOverview(movieViewModel.overview)
            self.view?.setReleaseDate(movieViewModel.releaseDate)
            self.view?.setVoteCount(movieViewModel.voteCount)
            self.view?.setAverageRate(movieViewModel.voteAverage)
        }
    }
    
    func movieDetailsFetchedFailed(withError baseError: Error) {
        DispatchQueue.main.async {
            self.view?.showError(withError: baseError, dismissView: true)
        }
        
    }
}
