//
//  MoviesViewModel.swift
//  OCSTest
//
//  Created by Yasin AKINCI on 25/01/2022.
//

import Foundation
import Combine

final class MoviesViewModel {
    
    // Les sujets, ceux qui émettent et reçoivent des événements
    var updateResult = PassthroughSubject<Bool, Error>()
    @Published var searchQuery = ""

    // Pour la gestion mémoire et l'annulation des abonnements
    private var subscriptions = Set<AnyCancellable>()
    
    var moviesModel: MoviesModel?
    
    init() {
        searchQueryBinding()
    }
    
    private func searchQueryBinding() {
        $searchQuery
            .receive(on: RunLoop.main)
            .removeDuplicates()
            .debounce(for: .seconds(0.5), scheduler: RunLoop.main)
            .sink { [weak self] searchValue in
                MoviesServices.search(movie: searchValue, completion: { [weak self] result in
                    switch result {
                    case .success(let movies):
                        self?.moviesModel = MoviesModel(movies: movies)
                        self?.updateResult.send(true)
                    case .failure(let error):
                        self?.updateResult.send(completion: .failure(error))
                    }
                })
            }
            .store(in: &subscriptions)
    }
    
}
