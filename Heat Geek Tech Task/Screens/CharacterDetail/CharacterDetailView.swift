//
//  ContentView.swift
//  Heat Geek Tech Task
//
//  Created by Nov Petrović on 01/05/2024.
//

import SwiftUI

struct CharacterDetailView: View {
    var character: Character

    var body: some View {
        VStack {
            Text(character.name)
                .font(.largeTitle)
                .padding()
            
            HGRemoteImage(urlString: character.imageUrl ?? "")
                .aspectRatio(contentMode: .fit)
                .frame(height: 500)
                .cornerRadius(8)
        }
    }
}

#Preview {
    CharacterDetailView(character: Character(name: "Test", imageUrl: ""))
}
