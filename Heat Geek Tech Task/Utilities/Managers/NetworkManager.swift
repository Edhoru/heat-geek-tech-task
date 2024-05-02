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
    
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void) {
        
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response , _ in
            
            guard let data = data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        dataTask.resume()
    }
}
