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
            guard case let .success(movies) = result
            else {
                self.presenter.updateViewForNoData()
                return
            }
            self.presenter.updateView(withMovies: movies)
        }
    }
}
