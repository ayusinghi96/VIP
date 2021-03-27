//
//  MovieCell.swift
//  VIP
//
//  Created by Ayush Singhi on 27/03/21.
//

import UIKit


///
/// Movie cell to present a single movie.
///
class MovieCell: UITableViewCell {

    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var yearLabel: UILabel!

    override func awakeFromNib() {

        super.awakeFromNib()
    }
}


// MARK: - View props
extension MovieCell {

    struct ViewProps {

        var title: String
        var year: Int
    }

    func render(props: ViewProps) {

        self.titleLabel.text = props.title.capitalized
        self.yearLabel.text = String(props.year)
    }
}
