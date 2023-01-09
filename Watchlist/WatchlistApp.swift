//
//  WatchlistApp.swift
//  Watchlist
//
//  Created by Julien Onorato on 09/01/2023.
//

import SwiftUI

@main
struct WatchlistApp: App {
    
    @StateObject var movieViewModel: MovieViewModel = MovieViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(movieViewModel)
        }
    }
}
