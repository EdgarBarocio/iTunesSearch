//
//  Song.swift
//  CodingChallenge
//
//  Created by Edgar Barocio on 6/22/19.
//  Copyright © 2019 Edgar Barocio. All rights reserved.
//

import Foundation

class SongResponse {
    
    let artistName: String
    let trackName: String
    let artworkUrl100: String
    
    init(name: String, artist: String, artworkUrl100: String) {
        self.trackName = name
        self.artistName = artist
        self.artworkUrl100 = artworkUrl100
    }
}
