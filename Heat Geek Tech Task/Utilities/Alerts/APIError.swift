//
//  APIError.swift
//  Heat Geek Tech Task
//
//  Created by Nov Petrović on 01/05/2024.
//

import Foundation

enum APIError: Error, Equatable {
    case invalidURL
    case responseProblem
    case decodingProblem
}
