//
//  ContentView.swift
//  Heat Geek Tech Task
//
//  Created by Nov Petrović on 01/05/2024.
//

import SwiftUI

struct CharacterListView: View {
    
    @StateObject var viewModel = AppetizerListViewModel()
    @State private var isShowingDetail = false
    @State private var selectedCharacter: Character?
    
    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.characters, id: \.self) { character in
                    HGListCell(character: character)
                        .onTapGesture {
                            selectedCharacter = character
                            isShowingDetail = true
                        }
                }
                .navigationTitle("Characters")
                .disabled( isShowingDetail)
            }
            .onAppear {
                viewModel.fetchCharacters()
            }
            .blur(radius: isShowingDetail ? 20 : 0)
            
            if isShowingDetail {
                CharacterDetailView(character: selectedCharacter!, 
                                    isShowingDetail: $isShowingDetail)
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
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
