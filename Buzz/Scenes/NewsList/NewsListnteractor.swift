//
//  NewsListInteractor.swift
//  Buzz
//
//  Created by Giovanna Moeller on 29/05/24.
//

import Foundation

protocol NewsListBusinessLogic {
    func loadNews(request: NewsListModel.FetchNews.Request)
}

protocol NewsListDataStore {
    var articles: [Article] { get set }
}

class NewsListInteractor {
    private var worker: NewsAPIWorker
    var presenter: NewsListPresentationLogic?

    var articles: [Article] = []
    
    init(worker: NewsAPIWorker = NewsAPIWorker(networkService: URLSessionNetworking())) {
        self.worker = worker
    }

    func loadNews(request: NewsListModel.FetchNews.Request) {
        worker.fetchNews { [weak self] result in
            guard let self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let fetchedArticles):
                    self.articles = fetchedArticles
                    let response = NewsListModel.FetchNews.Response(articles: fetchedArticles)
                    self.presenter?.presentFetchedNews(response: response)
                case .failure(let failure):
                    print("Ocorreu um erro ao obter a lista de notícias: \(failure.localizedDescription)")
                    self.presenter?.presentError(error: failure)
                }
            }
        }
    }
}
