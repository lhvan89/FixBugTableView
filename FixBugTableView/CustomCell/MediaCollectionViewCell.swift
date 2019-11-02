//
//  MediaCollectionViewCell.swift
//  FixBugTableView
//
//  Created by Van Le on 11/2/19.
//  Copyright © 2019 ITPS. All rights reserved.
//

import UIKit

class MediaCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageView.layer.cornerRadius = 10
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = #colorLiteral(red: 0.1725490196, green: 0.4549019608, blue: 0.2196078431, alpha: 1)
    }
    
    func loadData(item: Media) {
        guard let url = URL(string: item.url) else { return }
        imageView.loadImage(url: url)
    }
}
