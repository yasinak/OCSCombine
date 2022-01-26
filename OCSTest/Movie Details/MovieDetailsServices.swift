//
//  MovieDetailsServices.swift
//  OCSTest
//
//  Created by Yasin AKINCI on 27/01/2022.
//

import Foundation

final class MovieDetailsServices {
    
    static func fetchDetails(detaillink: String, completion: @escaping (Result<MovieDetails, Error>) -> Void) {
        guard !detaillink.isEmpty else {
            return
        }
        if let url = URL(string: URLs.detailsUrl(with: detaillink)) {
            let urlSession = URLSession(configuration: .default).dataTask(with: url) { (data, response, error) in
                if let error = error {
                    completion(.failure(error))
                }
                if let data = data {
                    do {
                        let movieDetails = try JSONDecoder().decode(MovieDetails.self, from: data)
                        completion(.success(movieDetails))
                    } catch {
                        // TODO: MANAGE ERROR JSON DECODE
                        print("JSON Decode error!!!")
                    }
                }
            }
            urlSession.resume()
        }
    }
    
    
}
