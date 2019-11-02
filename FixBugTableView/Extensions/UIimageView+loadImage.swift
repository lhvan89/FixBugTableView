//
//  UIimageView+LoadImage.swift
//  FixBugTableView
//
//  Created by Van Le on 11/2/19.
//  Copyright © 2019 ITPS. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func loadImage(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}