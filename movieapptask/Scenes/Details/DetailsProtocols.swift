//
//  DetailsProtocols.swift
//  movieapptask
//
//  Created by Shady K. Maadawy on 17/01/2023.
//

import Foundation

protocol DetailsViewProtocol: AnyObject {
    var presenter: DetailsPresenterProtocol! { get set }
    func layoutSubView()
    func setImagePath(with posterPath: String)
    func setOverview(_ message: NSAttributedString)
    func setReleaseDate(_ date: NSAttributedString)
    func setAverageRate(_ rate: NSAttributedString)
    func setVoteCount(_ count: NSAttributedString)
}

typealias DetailsViewDelegates = DetailsViewProtocol & BaseUIViewControllerDelegates

protocol DetailsPresenterProtocol: AnyObject {
    var view: DetailsViewDelegates? { get set }
    func notifyInteractor()
}

protocol DetailsInteractorInputProtocol: AnyObject {
    var presenter: DetailsInteractorOutputProtocol? { get set }
    func getDetails(with movieIndex: Int)
}

protocol DetailsInteractorOutputProtocol: AnyObject {
    func movieDetailsFetchedSuccessfully(with movieModel: MovieDetailsModel)
    func movieDetailsFetchedFailed(withError baseError: Error)
}
