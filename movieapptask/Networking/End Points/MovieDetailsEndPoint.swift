//
//  MovieDetailsEndPoint.swift
//  movieapptask
//
//  Created by Shady K. Maadawy on 17/01/2023.
//

import Foundation

struct MovieDetailsEndPoint: ApiEndPoint {

    private let movieIndex: Int
    
    init(_ movieIndex: Int) {
        self.movieIndex = movieIndex
    }
    
    var host: endpointHosts {
        return endpointHosts.tmdbRestAPI
    }
    
    var path: endpointPaths {
        return endpointPaths.movieDetails
    }
    
    var scheme: endPointScheme {
        return endPointScheme.https
    }
    
    var method: httpRequestMethods {
        return httpRequestMethods.get
    }
    
    var parameters: [URLQueryItem]? {
        return [
            self.apiKey
        ]
    }
    var query: String? {
        return "\(self.movieIndex)"
    }
}
