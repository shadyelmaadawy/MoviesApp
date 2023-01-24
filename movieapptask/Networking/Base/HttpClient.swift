//
//  HttpClient.swift
//  movieapptask
//
//  Created by Shady K. Maadawy on 17/01/2023.
//

import Foundation

final class HttpClient {

    private let logger = Logger.shared
    
    enum httpClientErrorCode: LocalizedError {
        case timeout
        case invaildRequest
        case invalidURL
        case invaildData
        case invalidResponse
        var errorDescription: String? {
            switch(self) {
                case .timeout:
                    return "Connection timeout."
                case .invalidURL:
                    return "This url is not vaild."
                case .invaildData:
                    return "Data is not valid."
                case .invalidResponse:
                    return "Response of network request is not equal to 200."
                case .invaildRequest:
                    return "An error has been occurred while processing your request."
            }
        }
    }
    
    class func makeURLRequest(_ endpoint: ApiEndPoint) throws -> URLRequest {
        var urlComponents            = URLComponents()
        urlComponents.scheme         = endpoint.scheme.rawValue
        urlComponents.host           = endpoint.host.rawValue
        urlComponents.path           = endpoint.path.rawValue
        switch(endpoint) {
            case is MoviePosterEndPoint:
                urlComponents.path       = endpoint.path.rawValue + endpoint.query!
            case is MovieDetailsEndPoint:
                urlComponents.queryItems = endpoint.parameters
                urlComponents.path       = endpoint.path.rawValue + endpoint.query!
            default:
                urlComponents.queryItems = endpoint.parameters
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
    
    func makeHttpRequest(endpoint: ApiEndPoint, handler: @escaping(Result<Data, Error>) -> ()) {
        do {
            let urlRequest = try Self.makeURLRequest(endpoint)
            URLSession.init(configuration: .default).dataTask(with: urlRequest) { [weak logger] networkData, networkResponse, networkError in
                guard let logger = logger else { return }
                guard networkError == nil else {
                    handler(.failure(networkError!))
                    return
                }
                guard let networkResponse = networkResponse as? HTTPURLResponse,
                      networkResponse.statusCode == 200 else {
                        handler(.failure(httpClientErrorCode.invalidResponse))
                        return
                }
                logger.debug(buffer: networkResponse.allHeaderFields)
                guard let networkData = networkData else {
                    handler(.failure(httpClientErrorCode.invaildData))
                    return
                }
                logger.debug(buffer: String(data: networkData, encoding: .utf8) ?? "")
                handler(.success(networkData))
            }.resume()
        } catch {
            handler(.failure(error))
        }
    }
}
