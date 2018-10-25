//
//  Character.swift
//  RickAndMorty
//
//  Created by Xavier on 10/24/18.
//  Copyright © 2018 Xavier ios dev. All rights reserved.
//

import Foundation

class Character {
    var id: Int
    var name: String
    var status: String
    var imageURLAsString: String?
    
    init?(dictionary: [String : Any]) {
//        guard let results = dictionary["results"] as? [String : Any],
            guard let id = dictionary["id"] as? Int,
            let name = dictionary["name"] as? String,
            let status = dictionary["status"] as? String,
            let image = dictionary["image"] as? String else { return nil}
        
        self.id = id
        self.name = name
        self.status = status
        self.imageURLAsString = image
        
//        if let imageURLAsString = image {
//            self.imageURLAsString = imageURLAsString
//        } else {
//            self.imageURLAsString = nil
//        }
    }
}

