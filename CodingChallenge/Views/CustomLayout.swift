//
//  CustomLayout.swift
//  CodingChallenge
//
//  Created by Edgar Barocio on 6/23/19.
//  Copyright © 2019 Edgar Barocio. All rights reserved.
//

import UIKit

class CustomLayout: UICollectionViewFlowLayout {

    var numberOfItemsPerRow: Int = 2 {
        didSet {
            invalidateLayout()
        }
    }
    
    override func prepare() {
        super.prepare()
        
        if let collectionView = self.collectionView {
            var newItemSize = itemSize
            
            // Always use an item count of at least 1 and convert it to a float to use in size calculations
            let itemsPerRow = CGFloat(max(numberOfItemsPerRow, 1))
            
            // Calculate the sum of the spacing between cells
            let totalSpacing = minimumInteritemSpacing * (itemsPerRow - 1.0)
            
            // Calculate how wide items should be
            newItemSize.width = (collectionView.bounds.size.width - sectionInset.left - sectionInset.right - totalSpacing) / itemsPerRow
            
            // Use the aspect ratio of the current item size to determine how tall the items should be
            if itemSize.height > 0 {
                let itemAspectRatio = itemSize.width / itemSize.height
                newItemSize.height = newItemSize.width / itemAspectRatio
            }
            
            // Set the new item size
            itemSize = newItemSize
        }
    }
}
