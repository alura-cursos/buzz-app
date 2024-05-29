//
//  URLSessionNetworking.swift
//  Buzz
//
//  Created by Giovanna Moeller on 29/05/24.
//

import Foundation

protocol NetworkingService {
    func request<T: Decodable>(url: URL, completion: @escaping (Result<T, Error>) -> Void)
}

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case decodingError
}

class URLSessionNetworking: NetworkingService {
    func request<T>(url: URL, completion: @escaping (Result<T, any Error>) -> Void) where T: Decodable {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error {
                completion(.failure(error))
                return
            }
            
            guard let data else {
                completion(.failure(NetworkError.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let decodedData = try decoder.decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(NetworkError.decodingError))
            }
        }
        task.resume()
    }
}

