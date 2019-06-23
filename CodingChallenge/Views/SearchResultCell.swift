//
//  SearchResultCell.swift
//  CodingChallenge
//
//  Created by Edgar Barocio on 6/23/19.
//  Copyright © 2019 Edgar Barocio. All rights reserved.
//

import UIKit

class SearchResultCell: UICollectionViewCell {

    static let identifier = "SearchResultCell"
    
    @IBOutlet var albumArt: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var artistLabel: UILabel!
    
    func update(with imageURL: String?, title: String?, artist: String?) {
        
        if let url = URL(string: imageURL ?? "") {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url) {
                    DispatchQueue.main.async {
                        self.albumArt.image = UIImage(data: data)
                    }
                }
            }
        }
        
        titleLabel.text = title
        artistLabel.text = artist
    }
}
