//
//  ContentView.swift
//  Heat Geek Tech Task
//
//  Created by Nov Petrović on 01/05/2024.
//

import SwiftUI

struct CharacterListView: View {
    
    @StateObject var viewModel = AppetizerListViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.characters, id: \.self) { character in
                NavigationLink(destination: CharacterDetailView(character: character)) {
                    Text(character.name)
                }
            }
            .navigationTitle("Characters")
        }
        .padding()
        .onAppear {
            viewModel.fetchCharacters()
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

#Preview {
    CharacterListView()
}
