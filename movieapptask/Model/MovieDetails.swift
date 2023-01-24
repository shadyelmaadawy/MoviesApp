//
//  MovieDetails.swift
//  movieapptask
//
//  Created by Shady K. Maadawy on 17/01/2023.
//

import UIKit

struct MovieDetailsModel: Codable {
    let id: Int
    let originalLanguage: String
    let originalTitle: String
    let title: String
    let adult: Bool
    let overview: String
    let posterPath: String
    let releaseDate: String
    let voteAverage: Double
    let voteCount: Double
    
    enum CodingKeys: String, CodingKey {
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case title
        case adult
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

struct MovieDetailsViewModel {
    let title: String
    let posterPath: String
    let overview: NSAttributedString
    let releaseDate: NSAttributedString
    let voteAverage: NSAttributedString
    let voteCount: NSAttributedString
    
    init(with movieModel: MovieDetailsModel) {
        self.title = movieModel.title
        self.posterPath = movieModel.posterPath
        self.overview = .createBaseAttributedString(
            "Overview:\n", movieModel.overview,
            attributes:
            [ .foregroundColor: UIColor.label, .font: UIFont.preferredFont(forTextStyle: .title3)],
            [ .foregroundColor: UIColor.secondaryLabel, .font: UIFont.preferredFont(forTextStyle: .body)]
        )
        self.releaseDate = .createBaseAttributedString(
            "Release Date:\n", movieModel.releaseDate,
            attributes:
            [ .foregroundColor: UIColor.label, .font: UIFont.preferredFont(forTextStyle: .headline)],
            [ .foregroundColor: UIColor.secondaryLabel, .font: UIFont.preferredFont(forTextStyle: .subheadline)])
        self.voteAverage = .createBaseAttributedString(
            "Rate:\n", String(movieModel.voteAverage),
            attributes:
            [ .foregroundColor: UIColor.label, .font: UIFont.preferredFont(forTextStyle: .headline)],
            [ .foregroundColor: UIColor.secondaryLabel, .font: UIFont.preferredFont(forTextStyle: .subheadline)])
        self.voteCount = .createBaseAttributedString(
            "Rate Count:\n",  String(Int(movieModel.voteCount)),
            attributes:
            [ .foregroundColor: UIColor.label, .font: UIFont.preferredFont(forTextStyle: .headline)],
            [ .foregroundColor: UIColor.secondaryLabel, .font: UIFont.preferredFont(forTextStyle: .subheadline)])
    }
    
}
