//
//  MoviesListController.swift
//  VIP
//
//  Created by Ayush Singhi on 27/03/21.
//

import UIKit


///
/// A controller to show a list of movies.
///
class MoviesListController: UIViewController {

    @IBOutlet private var tableView: UITableView!

    private(set) var props: ViewProps = .default
    public var interactor: MoviesListInteractor?

    override func viewDidLoad() {

        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.interactor?.getMovies()
    }
}


// MARK: - Table view data source and delegate conformance.
extension MoviesListController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return self.props.movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as? MovieCell
        else { fatalError("Cannot dequeue MovieCell") }

        let movie = self.props.movies[indexPath.row]
        cell.render(props: .init(title: movie.title, year: movie.year))
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}


// MARK: - View prpos
extension MoviesListController {

    struct ViewProps {

        var movies: [Movie]
        var error: Bool

        static let `default`: Self = .init(movies: [], error: false)
    }

    public func render(props: ViewProps) {

        self.props = props

        guard self.isViewLoaded else { return }
        self.tableView.reloadData()

        if props.error {
            self.showErrorPopup()
        }
    }

    private func showErrorPopup() {

        let alert = UIAlertController(
            title: nil,
            message: "No movies found",
            preferredStyle: .alert
        )
        alert.addAction(.init(
            title: "Ok",
            style: .default,
            handler: { _ in }
        ))
        self.present(alert, animated: true)
    }
}
