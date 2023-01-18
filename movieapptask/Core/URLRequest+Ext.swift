//
//  URLRequest+Ext.swift
//  movieapptask
//
//  Created by Shady K. Maadawy on 17/01/2023.
//

import Foundation

extension HttpClient {
    
    class func makeURLRequest(_ endpoint: ApiEndPoint) throws -> URLRequest {
        var urlComponents            = URLComponents()
        urlComponents.scheme         = endpoint.scheme.rawValue
        urlComponents.host           = endpoint.host.rawValue
        urlComponents.path           = endpoint.path.rawValue
        if let parameters = endpoint.parameters {
            urlComponents.queryItems = parameters
            if let query = endpoint.query {
                urlComponents.path   = endpoint.path.rawValue + query
            }
        } else {
            if let query = endpoint.query {
                urlComponents.path   = endpoint.path.rawValue + query
            }
        }
        guard let baseURL = urlComponents.url else {
            throw HttpClient.httpClientErrorCode.invalidURL
        }
        var urlRequst                = URLRequest(url: baseURL)
        urlRequst.httpMethod         = endpoint.method.rawValue
        urlRequst.networkServiceType = .responsiveData
        urlRequst.cachePolicy        = .reloadIgnoringLocalAndRemoteCacheData
        return urlRequst
    }

}

