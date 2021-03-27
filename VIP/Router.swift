//
//  Router.swift
//  VIP
//
//  Created by Ayush Singhi on 27/03/21.
//

import Foundation
import UIKit


class Router {

    private var navigationController: UINavigationController

    init(navigationController: UINavigationController) {

        self.navigationController = navigationController
    }

    func startNavigation() {
        self.showMoviesListView()
    }
}


extension Router {

    private func getStoryboard(named name: String) -> UIStoryboard {

        return UIStoryboard.init(name: name, bundle: .main)
    }
}

extension Router {

    private func showMoviesListView() {

        let storyboard = self.getStoryboard(named: "MoviesList")
        guard let controller = storyboard.instantiateInitialViewController() as? MoviesListController
        else { return }
        let presenter = MoviesListPresenter(controller: controller)
        let interactor = MoviesListInteractor(presenter: presenter)
        controller.interactor = interactor

        self.navigationController.pushViewController(controller, animated: true)
    }
}


