//
//  Song.swift
//  CodingChallenge
//
//  Created by Edgar Barocio on 6/22/19.
//  Copyright © 2019 Edgar Barocio. All rights reserved.
//

import Foundation

public struct SongsResponse: Decodable {
    let resultCount: UInt
    let results: [SongResponse]
}

public struct SongResponse: Decodable {
    
    let artistName: String
    let trackId: Int
    let trackName: String
    let trackViewUrl: String
    let previewUrl: String?
    let artworkUrl100: String
    let releaseDate: String
    let primaryGenreName: String
    let trackPrice: Float?
    let currency: String
    let trackTimeMillis: Int?
    let collectionName: String?
}
