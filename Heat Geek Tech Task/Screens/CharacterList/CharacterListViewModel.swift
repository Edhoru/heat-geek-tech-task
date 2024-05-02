//
//  CharacterListViewModel.swift
//  Heat Geek Tech Task
//
//  Created by Nov Petrović on 02/05/2024.
//

import SwiftUI

final class AppetizerListViewModel: ObservableObject {
    
    @Published var characters: [Character] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    
    func fetchCharacters() {
        isLoading = true
        
        NetworkManager.shared.fetchCharacters { result in
            DispatchQueue.main.async {
                self.isLoading = false
                
                switch result {
                case .success(let characters):
                    self.characters = characters
                    
                case .failure(let error):
                    switch error {
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidURL
                        
                    case .responseProblem:
                        self.alertItem = AlertContext.responseProblem
                        
                    case .decodingProblem:
                        self.alertItem = AlertContext.decodingProblem
                    }
                }
            }
        }
    }
}
