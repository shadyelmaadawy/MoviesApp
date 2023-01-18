//
//  NetworkEngine.swift
//  movieapptask
//
//  Created by Shady K. Maadawy on 15/01/2023.
//

import Foundation

final class NetworkEngine {
    
    private let httpClient = HttpClient()
    
    func get<T: Codable>(endPoint: ApiEndPoint, as codableType: T.Type, handler: @escaping(Result<T, Error>) -> ()) {
        self.httpClient.makeHttpRequest(endpoint: endPoint) { networkRequestResult in
            switch(networkRequestResult) {
                case .success(let networkData):
                do {
                    let decodedJson = try JSONDecoder().decode(codableType.self, from: networkData)
                    handler(.success(decodedJson))
                } catch {
                    handler(.failure(error))
                }
                case .failure(let networkError):
                    handler(.failure(networkError))
            }
        }
    }
    
}
