//
//  ContentView.swift
//  Heat Geek Tech Task
//
//  Created by Nov Petrović on 01/05/2024.
//

import SwiftUI

struct CharacterListView: View {
    
    @State private var characters = [Character]()
    
    var body: some View {
        VStack {
            List(characters, id: \.self) { character in
                Text(character.name)
            }
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
