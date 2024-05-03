//
//  NetworkManager.swift
//  Heat Geek Tech Task
//
//  Created by Nov Petrović on 01/05/2024.
//

import UIKit

final class NetworkManager {
    
    // MARK: - Properties
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    // MARK: - Private Init to avoid multiple instances
    private init() { }
    
    // MARK: Public Interface
    func fetchCharacters() async throws -> [Character] {
            var urlRequest = URLRequest(url: URL(string: "https://api.disneyapi.dev/character")!)
            urlRequest.httpMethod = "GET"
            
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200..<300).contains(httpResponse.statusCode) else {
                throw APIError.responseProblem
            }
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .formatted(dateFormatter())
            let decodedData = try decoder.decode(ResponseWrapper.self, from: data)
            return decodedData.data
        }
    
    private func dateFormatter() -> DateFormatter {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
            formatter.timeZone = TimeZone(secondsFromGMT: 0)
            formatter.locale = Locale(identifier: "en_US_POSIX")
            return formatter
        }
}
