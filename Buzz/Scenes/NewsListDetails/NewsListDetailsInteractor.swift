//
//  NewsListDetailsInteractor.swift
//  Buzz
//
//  Created by Giovanna Moeller on 29/05/24.
//

import UIKit

protocol NewsListDetailsBusinessLogic {
    func loadNewsFromId(articleId: Int)
}

protocol NewsListDetailsDataStore {
    var article: Article? { get set }
}

class NewsListDetailsInteractor: NewsListDetailsBusinessLogic, NewsListDetailsDataStore {
            
    var article: Article?
    private var worker: NewsAPIWorker
    
    init(worker: NewsAPIWorker = NewsAPIWorker(networkService: URLSessionNetworking())) {
        self.worker = worker
    }

    func loadNewsFromId(articleId: Int) {
        worker.fetchNewsById(articleID: articleId) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let fetchedArticle):
                    self?.article = fetchedArticle
                case .failure(let failure):
                    print(failure.localizedDescription)
                }
            }
        }
    }
}
