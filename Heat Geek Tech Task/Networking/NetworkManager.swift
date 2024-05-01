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
    
    // MARK: - Private Init to avoid multiple instances
    private init() { }
    
    // MARK: Public Interface
    func fetchCharacters(completion: @escaping(Result<[Character], APIError>) -> Void) {
        do {
            var urlRequest = URLRequest(url: URL(string: "https://api.disneyapi.dev/character")!)
            urlRequest.httpMethod = "GET"
            
            let dataTask = URLSession.shared.dataTask(with: urlRequest) { data, response , _ in
                
                guard let httpResponse = response as? HTTPURLResponse,
                      (200..<300).contains(httpResponse.statusCode),
                      let jsonData = data else {
                    completion(.failure(.responseProblem))
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let decodedData = try decoder.decode(ResponseWrapper.self, from: jsonData)
                    completion(.success(decodedData.data))
                } catch {
                    print("Decoding error: \(error)")
                    completion(.failure(.decodingProblem))
                }
            }
            dataTask.resume()
        }
    }
}
