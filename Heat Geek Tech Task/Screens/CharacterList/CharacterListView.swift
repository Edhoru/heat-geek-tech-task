//
//  ContentView.swift
//  Heat Geek Tech Task
//
//  Created by Nov Petrović on 01/05/2024.
//

import SwiftUI

struct CharacterListView: View {
    
    @StateObject var viewModel = CharacterListViewModel()
    
    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.characters, id: \.self) { character in
                    HGListCell(character: character)
                        .onTapGesture {
                            withAnimation {
                                viewModel.selectedCharacter = character
                                viewModel.isShowingDetail = true
                            }
                        }
                }
                .navigationTitle("Characters")
                .disabled(viewModel.isShowingDetail)
            }
            .onAppear {
                Task {
                    await viewModel.fetchCharacters()
                }
            }
            .blur(radius: viewModel.isShowingDetail ? 20 : 0)
            
            if viewModel.isShowingDetail {
                CharacterDetailView(character: viewModel.selectedCharacter!,
                                    isShowingDetail: $viewModel.isShowingDetail)
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

struct CharacterView: View {
    let character: Character
    
    var body: some View {
        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Hello, world!@*/Text("Hello, world!")/*@END_MENU_TOKEN@*/
    }
    
}
