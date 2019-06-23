//
//  SearchDataSource.swift
//  CodingChallenge
//
//  Created by Edgar Barocio on 6/23/19.
//  Copyright © 2019 Edgar Barocio. All rights reserved.
//

import UIKit

class SearchDataSource: NSObject, UICollectionViewDataSource {
    
    var results: [SongResponse] = []
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return results.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = "SearchResultCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! SearchResultCell
        
        return cell
    }
}
