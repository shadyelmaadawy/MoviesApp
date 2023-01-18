//
//  PopularMovie.swift
//  movieapptask
//
//  Created by Shady K. Maadawy on 16/01/2023.
//

import Foundation

struct PopularMoviesResult: Codable {
    let currentPage: Int
    let movies: [PopularMovieModel]
    let totalPages: Int

    enum CodingKeys: String, CodingKey {
        case currentPage = "page"
        case movies = "results"
        case totalPages = "total_pages"
    }
}

struct PopularMovieModel: Codable {
    let id: Int
    let title: String
    let posterPath: String
    let voteAverage: Double
    let adult: Bool
    let releaseDate: String
    let overview: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
        case adult
        case releaseDate = "release_date"
        case overview
    }

}

struct PopularMovieCellViewModel {
    let id: Int
    let rate: String
    let title: String
    let posterPath: String
    init(with movie: PopularMovieModel) {
        self.id = movie.id
        self.rate = String(movie.voteAverage)
        self.title = movie.title
        self.posterPath = movie.posterPath
    }
    
}
