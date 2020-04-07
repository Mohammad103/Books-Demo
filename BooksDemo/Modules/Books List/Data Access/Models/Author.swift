//
//  Author.swift
//  BooksDemo
//
//  Created by Mohammad Shaker on 4/7/20.
//  Copyright © 2020 Mohammad Shaker. All rights reserved.
//

import Foundation

struct Author : Codable {
    
    let id : String?
    let name : String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
    }
    
    init(name: String?) {
        id = nil
        self.name = name
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
    }
    
}
