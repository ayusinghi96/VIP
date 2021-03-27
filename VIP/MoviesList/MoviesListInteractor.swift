//
//  MoviesListInteractor.swift
//  VIP
//
//  Created by Ayush Singhi on 27/03/21.
//

import Foundation


class MoviesListInteractor {

    private var presenter: MoviesListPresenter

    init(presenter: MoviesListPresenter) {

        self.presenter = presenter
    }
}


// MARK: - Load data
extension MoviesListInteractor {

    func getMovies()
    {
        FileReader.getMovies { result in
            guard case var .success(movies) = result
            else {
                self.presenter.updateViewForNoData()
                return
            }
            movies = self.processMovies(movies: movies)
            self.presenter.updateView(withMovies: movies)
        }
    }
}


// MARK: - Business logic
extension MoviesListInteractor {

    ///
    /// Process movie data according to the requirment.
    ///
    func processMovies(movies: [Movie]) -> [Movie] {

        return movies.filter { movie in
            movie.imdbRating > 8.0
        }
    }
}
