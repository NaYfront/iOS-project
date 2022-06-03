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

//let headers = [
//    "X-RapidAPI-Host": "spotify23.p.rapidapi.com",
//    "X-RapidAPI-Key": "78a0835becmsh453eb9a2d4d3badp1a7a9cjsnf5aaf4be71e3"
//]
//
//let request = NSMutableURLRequest(url: NSURL(string: "https://spotify23.p.rapidapi.com/search/?q=query&type=tracks&offset=0&limit=10&numberOfTopResults=5")! as URL,
//                                        cachePolicy: .useProtocolCachePolicy,
//                                    timeoutInterval: 10.0)
//request.httpMethod = "GET"
//request.allHTTPHeaderFields = headers
//
//let session = URLSession.shared
//let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
//    if (error != nil) {
//        print(error)
//    } else {
//        let httpResponse = response as? HTTPURLResponse
//        print(httpResponse)
//    }
//})
//
//dataTask.resume()
