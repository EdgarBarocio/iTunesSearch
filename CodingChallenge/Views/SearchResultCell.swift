//
//  SearchResultCell.swift
//  CodingChallenge
//
//  Created by Edgar Barocio on 6/23/19.
//  Copyright © 2019 Edgar Barocio. All rights reserved.
//

import UIKit

class SearchResultCell: UICollectionViewCell {

    @IBOutlet weak var albumArt: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        update(with: nil, title: nil, artist: nil)
    }
    
    func update(with image: UIImage?, title: String?, artist: String?) {
        albumArt.image = image
        titleLabel.text = title
        artistLabel.text = artist
    }
}
