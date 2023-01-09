//
//  ListView.swift
//  Watchlist
//
//  Created by Julien Onorato on 09/01/2023.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var movieViewModel: MovieViewModel
    
    var body: some View {
        ZStack {
            if movieViewModel.movies.isEmpty {
                NoMoviesView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach(movieViewModel.movies) { movie in
                        MovieRowView(movie: movie)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    movieViewModel.updateIsWatched(item: movie)
                                }
                            }
                    }
                    .onDelete(perform: movieViewModel.deleteItem)
                    .onMove(perform: movieViewModel.moveItem)
                }
                .listStyle(PlainListStyle())
            }
        }
        .navigationTitle("Movies List")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("Add", destination: AddView())
            )
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .environmentObject(MovieViewModel())
    }
}
