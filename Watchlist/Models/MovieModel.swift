//
//  MovieModel.swift
//  Watchlist
//
//  Created by Julien Onorato on 09/01/2023.
//

import Foundation

struct MovieModel: Identifiable, Codable {
    let id: String
    let title: String
    let isWatched: Bool
    let rating: Int

    init(id: String = UUID().uuidString, title: String, isWatched: Bool, rating: Int) {
        self.id = id
        self.title = title
        self.isWatched = isWatched
        self.rating = rating
    }
    
    func updateIsWatched() -> MovieModel {
        return MovieModel(id: id, title: title, isWatched: !isWatched, rating: rating)
    }
}
