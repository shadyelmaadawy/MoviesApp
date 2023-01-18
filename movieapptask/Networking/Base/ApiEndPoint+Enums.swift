//
//  ApiEndPoint+Enums.swift
//  movieapptask
//
//  Created by Shady K. Maadawy on 17/01/2023.
//

import Foundation

enum endpointHosts: String {
    case tmdbRestAPI = "api.themoviedb.org"
    case tmdbImageStorage = "image.tmdb.org"
}

enum endpointPaths: String {
    case popularMovies = "/3/movie/popular"
    case movieDetails = "/3/movie/"
    case image = "/t/p/"
}

enum endPointScheme: String {
    case https = "https"
}

enum httpRequestMethods: String {
    case get = "GET"
}

protocol ApiEndPoint {
    var host: endpointHosts { get }
    var path: endpointPaths { get }
    var scheme: endPointScheme { get }
    var method: httpRequestMethods { get }
    var parameters: [URLQueryItem]? { get }
    var query: String? { get }
}

extension ApiEndPoint {
    var apiKey: URLQueryItem {
        return URLQueryItem(name: "api_key", value: "29910fc9ba04183903099fd5a6753a12")
    }
}

