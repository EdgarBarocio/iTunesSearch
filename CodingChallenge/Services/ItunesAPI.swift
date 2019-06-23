//
//  ItunesAPI.swift
//  CodingChallenge
//
//  Created by Edgar Barocio on 6/22/19.
//  Copyright © 2019 Edgar Barocio. All rights reserved.
//

import Foundation

class QueryService {
    
    typealias JSONDictionary = [String: Any]
    typealias QueryResult = ([SongResponse]?, String) -> ()
    
    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    var songs: [SongResponse] = []
    var errorMessage = ""
    
    func getSearchResults(searchTerm: String, completion: @escaping QueryResult) {
        
        dataTask?.cancel()
        
        if var urlComponents = URLComponents(string: "https://itunes.apple.com/search") {
            urlComponents.query = "media=music&entity=song&term=\(searchTerm)"
            
            guard let url = urlComponents.url else { return }
            
            dataTask = defaultSession.dataTask(with: url) { data, response, error in
                defer { self.dataTask = nil }
                
                if let error = error {
                    self.errorMessage += "DataTask error: " + error.localizedDescription + "\n"
                } else if let data = data,
                    let response = response as? HTTPURLResponse,
                    response.statusCode == 200 {
                    self.updateSearchResults(data)
                    
                    DispatchQueue.main.async {
                        completion(self.songs, self.errorMessage)
                    }
                }
            }
            
            dataTask?.resume()
        }
    }
    
    fileprivate func updateSearchResults(_ data: Data) {
        var response: JSONDictionary?
        songs.removeAll()
        
        do {
            response = try JSONSerialization.jsonObject(with: data, options: []) as? JSONDictionary
        } catch let parseError as NSError {
            errorMessage += "JSONSerialization error: \(parseError.localizedDescription)\n"
            return
        }
        
        guard let array = response!["results"] as? [Any] else {
            errorMessage += "Dictionary does not contain results key\n"
            return
        }
        for trackDictionary in array {
            if
                let trackDictionary = trackDictionary as? JSONDictionary,
                let name = trackDictionary["trackName"] as? String,
                let artist = trackDictionary["artistName"] as? String,
                let artworkUrl100 = trackDictionary["artworkUrl100"] as? String {
                
                songs.append(SongResponse(name: name, artist: artist, artworkUrl100: artworkUrl100))
            } else {
                errorMessage += "Problem parsing trackDictionary\n"
            }
        }
    }

}
