//
//  MoviesServices.swift
//  OCSTest
//
//  Created by Yasin AKINCI on 27/01/2022.
//

import Foundation

final class MoviesServices {
    
    static  func search(movie: String, completion: @escaping (Result<Movies, Error>) -> Void) {
        guard !movie.isEmpty else {
            return
        }
        if let urlWithValue = URLs.moviesUrl(for: movie) {
            if let url = URL(string: urlWithValue) {
                let urlSession = URLSession(configuration: .default).dataTask(with: url) { (data, response, error) in
                    if let error = error {
                        completion(.failure(error))
                    }
                    if let data = data {
                        do {
                            let movies = try JSONDecoder().decode(Movies.self, from: data)
                            completion(.success(movies))
                        } catch {
                            // TODO: MANAGE ERROR JSON DECODE
                        }
                    }
                }
                urlSession.resume()
            }
        }
    }
}
