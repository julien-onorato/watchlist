//
//  MovieRowView.swift
//  Watchlist
//
//  Created by Julien Onorato on 09/01/2023.
//

import SwiftUI

struct MovieRowView: View {
    
    let movie: MovieModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(movie.title)
                    .bold()
                Text(String(repeating: "⭐️", count: movie.rating))
            }
            Spacer()
            Text(movie.isWatched ? "Watched" : "Not watched")
                .bold(!movie.isWatched)
                .foregroundColor(movie.isWatched ? .green : .red)
        }
    }
}

struct MovieRowView_Previews: PreviewProvider {
    
    static var movie1 = MovieModel(title: "Titanic", isWatched: false, rating: 4)
    
    static var previews: some View {
        MovieRowView(movie: movie1)
    }
}
