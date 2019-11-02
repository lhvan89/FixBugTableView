//
//  Media.swift
//  FixBugTableView
//
//  Created by Van Le on 11/2/19.
//  Copyright © 2019 ITPS. All rights reserved.
//

import Foundation

class Media {
    var type: String = ""
    var url: String = ""
    
    init(type: String, url: String) {
        self.type = type
        self.url = url
    }
}

class Attachment {
    var date: String
    var listItem: [Media]
    init(date: String, listItem: [Media]) {
        self.date = date
        self.listItem = listItem
    }
}
