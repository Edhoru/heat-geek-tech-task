//
//  ContentView.swift
//  Heat Geek Tech Task
//
//  Created by Nov Petrović on 01/05/2024.
//

import SwiftUI

struct CharacterListView: View {
    
    @State private var characters = [Character]()
    @State private var selectedCharacter: Character?
    
    var body: some View {
        NavigationView {
            List(characters, id: \.self) { character in
                NavigationLink(destination: CharacterDetailView(character: character)) {
                    Text(character.name)
                }
            }
            .navigationTitle("Characters")
        }
        .padding()
        .onAppear {
            fetchCharacters()
        }
    }
    
    
    func fetchCharacters() {
        NetworkManager.shared.fetchCharacters { result in
            switch result {
            case .success(let characters):
                self.characters = characters
            case .failure(let error):
                print("DEBUG: Error: \(error)")
                return
            }
        }
    }
}

#Preview {
    CharacterListView()
}
