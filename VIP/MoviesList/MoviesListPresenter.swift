//
//  MoviesListPresenter.swift
//  VIP
//
//  Created by Ayush Singhi on 27/03/21.
//

import Foundation


///
/// The presenter to update view controller.
///
class MoviesListPresenter {

    private weak var controller: MoviesListController?

    init(controller: MoviesListController) {

        self.controller = controller
    }
}


// MARK: - Update views
extension MoviesListPresenter {

    func updateView(withMovies movies: [Movie]) {

        DispatchQueue.main.async {
            guard let controller = self.controller else { return }
            var props = controller.props
            props.movies = movies
            controller.render(props: props)
        }
    }

    func updateViewForNoData() {

        DispatchQueue.main.async {
            guard let controller = self.controller else { return }
            var props = controller.props
            props.error = true
            controller.render(props: props)
        }
    }
}
