//
//  NewsListDetailsInteractor.swift
//  Buzz
//
//  Created by Giovanna Moeller on 29/05/24.
//

import UIKit

protocol NewsListDetailsBusinessLogic {
    func loadNewsFromId(request: NewsListDetailsModel.FetchNewsDetails.Request)
}

protocol NewsListDetailsDataStore {
    var article: Article? { get set }
}

class NewsListDetailsInteractor: NewsListDetailsBusinessLogic, NewsListDetailsDataStore {
            
    var article: Article?
    private var worker: NewsAPIWorker
    var presenter: NewsListDetailsPresentationLogic?
    
    init(worker: NewsAPIWorker = NewsAPIWorker(networkService: URLSessionNetworking())) {
        self.worker = worker
    }

    func loadNewsFromId(request: NewsListDetailsModel.FetchNewsDetails.Request) {
        worker.fetchNewsById(articleID: request.id) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let fetchedArticle):
                    self?.article = fetchedArticle
                    let response = NewsListDetailsModel.FetchNewsDetails.Response(article: fetchedArticle)
                    self?.presenter?.presentFetchedNewsById(response: response)
                case .failure(let failure):
                    print(failure.localizedDescription)
                    self?.presenter?.presentError(error: failure)
                }
            }
        }
    }
}
