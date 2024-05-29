//
//  NewsListDetailsInteractor.swift
//  Buzz
//
//  Created by Giovanna Moeller on 29/05/24.
//

import Foundation

class NewsListInteractor {
    private var worker: NewsAPIWorker = NewsAPIWorker(networkService: URLSessionNetworking())
    var articles: [Article] = []
    
    init(worker: NewsAPIWorker = NewsAPIWorker(networkService: URLSessionNetworking())) {
        self.worker = worker
    }

    func loadNews() {
        worker.fetchNews { [weak self] result in
            guard let self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let fetchedArticles):
                    self.articles = fetchedArticles
                    print(fetchedArticles)
                case .failure(let failure):
                    print("Ocorreu um erro ao obter a lista de notícias: \(failure.localizedDescription)")
                }
            }
        }
    }
}
