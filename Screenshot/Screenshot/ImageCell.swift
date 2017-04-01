//
//  ImageCell.swift
//  Screenshot
//
//  Created by BumMo Koo on 2017. 4. 1..
//  Copyright © 2017년 BumMo Koo. All rights reserved.
//

import UIKit

class ImageCell: UICollectionViewCell {
    @IBOutlet fileprivate weak var imageView: UIImageView!
    
    var image: UIImage? {
        didSet {
            populate()
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
    private func populate() {
        imageView.image = image
    }
    
    private func resetCell() {
        imageView.image = nil
    }
}
