//
//  MovieCellViewModel.swift
//  OCSTest
//
//  Created by Yasin AKINCI on 26/01/2022.
//

import Foundation

struct MoviesModel {
    let count: Int
    var movieCellModels = [MovieCellModel]()
    
    init(movies: Movies) {
        self.count = movies.count ?? 0
        self.movieCellModels = movies.contents?.compactMap{ MovieCellModel(content: $0) } ?? []
    }
}

struct MovieCellModel {
    let title: String
    let subtitle: String
    let imageUrl: String
    let detaillink: String
    let fullscreenimageurl: String
    
    // Injection de dépendance
    init(content: MovieContents) {
        self.title = content.title?[0].value ?? ""
        self.subtitle = content.subtitle ?? ""
        self.imageUrl = content.imageurl ?? ""
        self.detaillink = content.detaillink ?? ""
        self.fullscreenimageurl = content.fullscreenimageurl ?? ""
    }
}
