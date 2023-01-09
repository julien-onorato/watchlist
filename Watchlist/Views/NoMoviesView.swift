//
//  NoMoviesView.swift
//  Watchlist
//
//  Created by Julien Onorato on 09/01/2023.
//

import SwiftUI

struct NoMoviesView: View {
    var body: some View {
        Text("No Movies in your list. Click 'Add'.")
            .bold()
    }
}

struct NoMoviesView_Previews: PreviewProvider {
    static var previews: some View {
        NoMoviesView()
    }
}
