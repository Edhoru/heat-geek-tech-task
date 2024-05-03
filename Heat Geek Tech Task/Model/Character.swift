//
//  Character.swift
//  Heat Geek Tech Task
//
//  Created by Nov Petrović on 01/05/2024.
//

import Foundation

struct ResponseWrapper: Codable {
    let data: [Character]
}

struct Character: Codable, Hashable, Identifiable {
    var id: Int
    let name: String
    let imageUrl: String?
    let createdAt: Date?
    let updatedAt: Date?
    let films: [String]
    let tvShows: [String]
    let videoGames: [String]
    let sourceUrl: String?
    let url: String?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case imageUrl
        case createdAt
        case updatedAt
        case films
        case tvShows
        case videoGames
        case sourceUrl
        case url
    }
    
    var processedImageURL: URL? {
        if let imageUrl = imageUrl {
            return URL(string: imageUrl)
        } else {
            return nil
        }
    }
}

extension Character {
    static func testCharacter() -> Character {
        Character(id: 1, name: "Test", imageUrl: "https://static.wikia.nocookie.net/disney/images/d/d3/Vlcsnap-2015-05-06-23h04m15s601.png", createdAt: nil, updatedAt: nil, films: [], tvShows: [], videoGames: [], sourceUrl: nil, url: nil)
    }
}
