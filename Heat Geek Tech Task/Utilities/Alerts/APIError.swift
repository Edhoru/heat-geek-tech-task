//
//  APIError.swift
//  Heat Geek Tech Task
//
//  Created by Nov Petrović on 01/05/2024.
//

import Foundation

enum APIError: Error, Equatable {
    
    // Common Errors
    case invalidURL
    case responseProblem
    case decodingProblem
    
    var localizedDescription: String {
        switch self {
        case .invalidURL:
            return "Well this is embarrasing... The url you're trying to send data to is invalid. Please report this to our team."
        case .responseProblem:
            return "Invalid response from the server. Please try again."
        case .decodingProblem:
            return "The data received from the server was invalid. Please try again."
        }
    }
}
