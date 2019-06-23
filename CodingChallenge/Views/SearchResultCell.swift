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
        
        //update(with: nil, title: nil, artist: nil)
    }
    
    func update(with imageURL: String?, title: String?, artist: String?) {
        
        let url = URL(string: imageURL ?? "")
        
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!)
            DispatchQueue.main.async {
                self.albumArt.image = UIImage(data: data!)
            }
        }
        titleLabel.text = title
        artistLabel.text = artist
    }
}
