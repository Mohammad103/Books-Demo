//
//  Book.swift
//  BooksDemo
//
//  Created by Mohammad Shaker on 4/7/20.
//  Copyright © 2020 Mohammad Shaker. All rights reserved.
//

import Foundation

struct Book : Codable {
    
    let id : String?
    let title : String?
    let cover: BookCover?
    var authors: [Author] = []
    var narrators: [Narrator] = []
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case cover = "cover"
        case authors = "authors"
        case narrators = "narrators"
    }
    
    init() {
        id = nil
        title = nil
        cover = nil
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        cover = try values.decodeIfPresent(BookCover.self, forKey: .cover)
        authors = try values.decodeIfPresent([Author].self, forKey: .authors) ?? []
        narrators = try values.decodeIfPresent([Narrator].self, forKey: .narrators) ?? []
    }
    
    // MARK: - Getter methods
    func authorsDescription() -> String {
        if authors.count == 0 {
            return ""
        }
        
        var result = "By: "
        for index in 0 ..< authors.count {
            guard let name = authors[index].name else { continue }
            result.append(name)
            if index < authors.count - 1 { // Not last item
                result.append(", ")
            }
        }
        return result
    }
    
    func narratorsDescription() -> String {
        if narrators.count == 0 {
            return ""
        }
        
        var result = "With: "
        for index in 0 ..< narrators.count {
            guard let name = narrators[index].name else { continue }
            result.append(name)
            if index < narrators.count - 1 { // Not last item
                result.append(", ")
            }
        }
        return result
    }
}
