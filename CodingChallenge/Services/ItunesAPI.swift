//
//  ItunesAPI.swift
//  CodingChallenge
//
//  Created by Edgar Barocio on 6/22/19.
//  Copyright © 2019 Edgar Barocio. All rights reserved.
//

import Foundation

enum ItunesError: Error {
    case invalidJSONData
}

enum EndPoint: String {
    case itunesSearch = "https://itunes.apple.com/search?term="
    case itunesLimit = "limit=50" //Decided to only show 50 results for simplicity
}

struct ItunesAPI {
    
    private static func searchURL() -> URL {
        
        return URL(string: "")!
    }
}
