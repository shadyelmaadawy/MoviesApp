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
    
    func makeHttpRequest(endpoint: ApiEndPoint, handler: @escaping(Result<Data, Error>) -> ()) {
        do {
            let urlRequest = try HttpClient.makeURLRequest(endpoint)
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
