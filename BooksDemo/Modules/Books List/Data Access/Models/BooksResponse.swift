//
//  BooksResponse.swift
//  BooksDemo
//
//  Created by Mohammad Shaker on 4/7/20.
//  Copyright © 2020 Mohammad Shaker. All rights reserved.
//

import Foundation

struct BooksResponse : Codable {
    
    let nextPageToken : String?
    var books: [Book] = []
    
    enum CodingKeys: String, CodingKey {
        case nextPageToken = "nextPageToken"
        case books = "items"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        nextPageToken = try values.decodeIfPresent(String.self, forKey: .nextPageToken)
        books = try values.decodeIfPresent([Book].self, forKey: .books) ?? []
    }
    
}
