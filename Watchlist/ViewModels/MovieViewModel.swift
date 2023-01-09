//
//  MovieViewModel.swift
//  Watchlist
//
//  Created by Julien Onorato on 09/01/2023.
//

import Foundation

class MovieViewModel: ObservableObject {
    
    @Published var movies: [MovieModel] = [] {
        didSet {
            saveItems()
        }
    }
    
    let moviesKey: String = "movies_key"
    
    init() {
        getMovies()
    }
    
    func getMovies() {
        guard
            let data = UserDefaults.standard.data(forKey: moviesKey),
            let savedItems = try? JSONDecoder().decode([MovieModel].self, from: data)
        else { return }

        self.movies = savedItems
    }
    
    func deleteItem(indexSet: IndexSet) {
        movies.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        movies.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String, rating: Int) {
        let newItem = MovieModel(title: title, isWatched: false, rating: rating)
        movies.append(newItem)
    }
    
    func updateIsWatched(item: MovieModel) {
        if let index = movies.firstIndex(where: { $0.id == item.id }) {
            movies[index] = item.updateIsWatched()
        }
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(movies) {
            UserDefaults.standard.set(encodedData, forKey: moviesKey)
        }
    }
    
}
