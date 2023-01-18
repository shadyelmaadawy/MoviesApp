//
//  MoviePosterEndPoint.swift
//  movieapptask
//
//  Created by Shady K. Maadawy on 17/01/2023.
//

import Foundation

struct MoviePosterEndPoint: ApiEndPoint {
    
    enum posterSizes: String {
        case small = "w92"
        case medium = "w185"
        case large = "w300"
    }
    
    private let posterName: String
    private let posterSize: posterSizes
    
    init(_ posterName: String, posterSize: posterSizes = .small) {
        self.posterName = posterName
        self.posterSize = posterSize
    }
    
    var host: endpointHosts {
        return endpointHosts.tmdbImageStorage
    }
    
    var path: endpointPaths {
        return endpointPaths.image
    }
    
    var scheme: endPointScheme {
        return endPointScheme.https
    }
    
    var method: httpRequestMethods {
        return httpRequestMethods.get
    }
    
    var query: String? {
        return "\(posterSize.rawValue)\(posterName)"
    }
    
    var parameters: [URLQueryItem]?
    
}
