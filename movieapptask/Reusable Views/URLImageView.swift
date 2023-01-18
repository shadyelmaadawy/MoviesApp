//
//  URLImageView.swift
//  movieapptask
//
//  Created by Shady K. Maadawy on 16/01/2023.
//

import UIKit

final class URLImageView: BaseUIImageView {
    
    private var urlSessionTask: URLSessionDataTask?
    
    private let loadingIndicator = LoadingIndicator()
    
    init() {
        super.init()
        self.setupLoadingIndicator()
    }
    
    private func setupLoadingIndicator() {

        self.addSubview(loadingIndicator)
        let loadingIndicatorConstraints = [
            loadingIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            loadingIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ]
        NSLayoutConstraint.activate(loadingIndicatorConstraints)
    }
    
    private func stopLoadingIndicator() {
        DispatchQueue.main.async {
            self.loadingIndicator.stopAnimating()
        }
    }
    
    func downloadImage(with posterPath: String) {
        do {
            let urlRequest = try HttpClient.makeURLRequest(MoviePosterEndPoint.init(posterPath, posterSize: .large))
            urlSessionTask = URLSession.init(configuration: .default).dataTask(
                with: urlRequest) { [weak self] networkData, networkResponse, networkError in
                    guard let self = self else { return }
                    guard networkError == nil else {
                        self.stopLoadingIndicator()
                        return
                    }
                    guard let networkResponse = networkResponse as? HTTPURLResponse,
                          networkResponse.statusCode == 200 else {
                        self.stopLoadingIndicator()
                        return
                    }
                    guard let networkData = networkData else {
                        self.stopLoadingIndicator()
                        return
                    }
                    guard let networkImage = UIImage(data: networkData) else {
                        self.stopLoadingIndicator()
                        return
                    }
                    DispatchQueue.main.async {
                        self.image = networkImage
                        self.layer.add(.fadeAnimation, forKey: nil)
                        self.loadingIndicator.stopAnimating()
                    }

            }
            DispatchQueue.main.async {
                self.loadingIndicator.startAnimating()
            }
            urlSessionTask?.resume()
        } catch {}
        
    }
    
    func cancelDownloadTask() {
        self.loadingIndicator.stopAnimating()
        self.urlSessionTask?.cancel()
        self.urlSessionTask = nil
        self.image = nil
    }
    
}
