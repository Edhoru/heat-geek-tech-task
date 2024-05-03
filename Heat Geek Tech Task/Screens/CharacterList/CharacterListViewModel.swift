//
//  CharacterListViewModel.swift
//  Heat Geek Tech Task
//
//  Created by Nov Petrović on 02/05/2024.
//

import SwiftUI

final class CharacterListViewModel: ObservableObject {
    
    @Published var characters: [Character] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetail = false
    @Published var selectedCharacter: Character?

    func fetchCharacters() async {
        DispatchQueue.main.async {
            self.isLoading = true
        }

        do {
            let fetchedCharacters = try await NetworkManager.shared.fetchCharacters()
            DispatchQueue.main.async {
                self.characters = fetchedCharacters
                self.isLoading = false
            }
        } catch let error as APIError {
            DispatchQueue.main.async {
                self.handleError(error)
                self.isLoading = false
            }
        } catch {
            DispatchQueue.main.async {
                self.alertItem = AlertItem(title: Text("Error"), message: Text("An unexpected error occurred."), dismissButton: .cancel())
                self.isLoading = false
            }
        }
    }

    private func handleError(_ error: APIError) {
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
