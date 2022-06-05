//
//  NetworkService.swift
//  SleepApp
//
//  Created by NaYfront on 27.05.2022.
//

import Foundation

protocol NetworkServiceProtocol {
    func getData(completion: @escaping (Result<[Comment]?, Error>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    func getData(completion: @escaping (Result<[Comment]?, Error>) -> Void) {
        let urlString = "https://jsonplaceholder.typicode.com/comments"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            do {
                let obj = try JSONDecoder().decode([Comment].self, from: data!)
                completion(.success(obj))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
