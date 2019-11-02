//
//  UIView+addShadow.swift
//  FixBugTableView
//
//  Created by Van Le on 11/2/19.
//  Copyright © 2019 ITPS. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func addShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.2
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 10
    }
}
