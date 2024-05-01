//
//  Character.swift
//  Heat Geek Tech Task
//
//  Created by Nov Petrović on 01/05/2024.
//

import Foundation

struct CharacterList: Codable {
    let characters: [Character]
}

struct Character: Codable, Hashable {
    let name: String
}
