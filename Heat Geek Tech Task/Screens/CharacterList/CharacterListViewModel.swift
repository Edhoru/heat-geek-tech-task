//
//  CharacterListViewModel.swift
//  Heat Geek Tech Task
//
//  Created by Nov Petrović on 02/05/2024.
//

import SwiftUI

final class AppetizerListViewModel: ObservableObject {
    
    @Published var characters = [Character]()
    
    func fetchCharacters() {
        NetworkManager.shared.fetchCharacters { result in
            DispatchQueue.main.async {
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
}
