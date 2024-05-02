//
//  HGListCell.swift
//  Heat Geek Tech Task
//
//  Created by Nov Petrović on 02/05/2024.
//

import SwiftUI

struct HGListCell: View {
    
    let character: Character
    
    var body: some View {
        Text(character.name)
    }
}
