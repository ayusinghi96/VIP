//
//  FileReader.swift
//  VIP
//
//  Created by Ayush Singhi on 27/03/21.
//

import Foundation


///
/// A file reader class.
///
/// - Note: Here we will decode  JSON data from a static file contaning Movies.
///
final class FileReader {

    public static func getMovies(
        callback: @escaping (Result<[Movie], FileReaderError>) -> Void)
    {
        guard let bundleUrlString = Bundle.main.url(forResource: "Movies", withExtension: "json")
        else { return }

        do {
            let data = try Data(contentsOf: bundleUrlString)
            let movies = try JSONDecoder().decode([Movie].self, from: data)
            callback(.success(movies))
        } catch {
            callback(.failure(FileReaderError()))
        }
    }
}


///
/// Error class for file reader.
///
class FileReaderError: Error {

    init () {}

    func presentError(withKey key: String)
    {
        print("Error:" + key)
    }
}
