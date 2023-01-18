//
//  PopularMovies.swift
//  movieapptask
//
//  Created by Shady K. Maadawy on 17/01/2023.
//

import Foundation

struct PopularMoviesEndPoint: ApiEndPoint {
    
    private let pageNumber: Int
    
    init(_ pageNumber: Int) {
        self.pageNumber = pageNumber
    }
    
    var host: endpointHosts {
        return endpointHosts.tmdbRestAPI
    }
    
    var path: endpointPaths {
        return endpointPaths.popularMovies
    }
    
    var scheme: endPointScheme {
        return endPointScheme.https
    }
    
    var method: httpRequestMethods {
        return httpRequestMethods.get
    }
    
    var parameters: [URLQueryItem]? {
        return [
            self.apiKey,
            URLQueryItem(name: "page", value: String(pageNumber))
        ]
    }
    
    var query: String?
}
