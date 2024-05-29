//
//  NewsAPIWorker.swift
//  Buzz
//
//  Created by Giovanna Moeller on 29/05/24.
//

import Foundation

enum NewsAPI {
    static let baseURL = "https://my-json-server.typicode.com/alura-cursos/news-api/"
    static let articles = "articles/"
}

class NewsAPIWorker {
    private let networkService: NetworkingService

    init(networkService: NetworkingService) {
        self.networkService = networkService
    }

    func fetchNews(completion: @escaping (Result<[Article], Error>) -> Void) {
        guard let url = URL(string: NewsAPI.baseURL + NewsAPI.articles) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        networkService.request(url: url) { (result: Result<[Article], Error>) in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func fetchNewsById(articleID: Int, completion: @escaping (Result<Article, Error>) -> Void) {
        guard let url = URL(string: NewsAPI.baseURL + NewsAPI.articles + "\(articleID)") else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        networkService.request(url: url) { (result: Result<Article, Error>) in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
