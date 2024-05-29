//
//  NewsListPresenter.swift
//  Buzz
//
//  Created by Giovanna Moeller on 29/05/24.
//

import Foundation

protocol NewsListPresentationLogic {
    func presentFetchedNews(response: NewsListModel.FetchNews.Response)
    func presentError(error: Error)
}

class NewsListPresenter: NewsListPresentationLogic {
    
    weak var viewController: NewsListDisplayLogic?
    
    func presentFetchedNews(response: NewsListModel.FetchNews.Response) {
        let displayedArticles = response.articles.map { article -> NewsListModel.FetchNews.ViewModel.DisplayedArticle in
            return NewsListModel.FetchNews.ViewModel.DisplayedArticle(
                id: article.id,
                title: article.title,
                author: article.author,
                description: article.description,
                publishedAt: formatDate(article.publishedAt),
                imageUrl: article.urlToImage
            )
        }
        let viewModel = NewsListModel.FetchNews.ViewModel(displayedArticles: displayedArticles)
        viewController?.displayFetchedNews(viewModel: viewModel)
    }
    
    func presentError(error: any Error) {
        viewController?.displayError(message: error.localizedDescription)
    }

    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.dateFormat = "d 'de' MMMM 'de' yyyy, 'às' HH:mm"
        return formatter.string(from: date)
    }
}
