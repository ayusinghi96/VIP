//
//  List.swift
//  VIPDemo
//
//  Created Ayush Singhi on 16/01/21.
//

import Foundation


///
/// A movie
///
struct Movie: Codable {

    /// Name of the movie
    var title: String
    /// Launch year.
    var year: Int
    /// The rating earned by the movie.
    var imdbRating: Float
}
