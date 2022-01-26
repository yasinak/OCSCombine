//
//  MovieDetailsViewModel.swift
//  OCSTest
//
//  Created by Yasin AKINCI on 26/01/2022.
//

import Foundation
import Combine

final class MovieDetailsViewModel {
    
    @Published var imageUrl: String
    @Published var title: String
    @Published var subtitle: String
    @Published var pitch: String?
    
    init(movieCellModel: MovieCellModel) {
        self.title = movieCellModel.title
        self.subtitle = movieCellModel.subtitle
        self.imageUrl = movieCellModel.imageUrl
    }
}
