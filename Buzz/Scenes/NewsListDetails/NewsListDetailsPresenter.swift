//
//  NewsListDetailsPresenter.swift
//  Buzz
//
//  Created by Giovanna Moeller on 29/05/24.
//

import UIKit

protocol NewsListDetailsPresentationLogic {
    func presentFetchedNewsById(response: NewsListDetailsModel.FetchNewsDetails.Response)
    func presentError(error: Error)
}

class NewsListDetailsPresenter: NewsListDetailsPresentationLogic {
    
    weak var viewController: NewsListDetailsDisplayLogic?
    
    func presentFetchedNewsById(response: NewsListDetailsModel.FetchNewsDetails.Response) {
        let article = response.article
        guard let article = article else { return }
        let displayedArticle = NewsListDetailsModel.FetchNewsDetails.ViewModel.DisplayedArticle(
            title: article.title,
            author: article.author,
            description: article.description,
            content: article.content,
            url: article.url,
            imageUrl: article.urlToImage,
            publishedAt: formatDate(article.publishedAt)
        )

        let viewModel = NewsListDetailsModel.FetchNewsDetails.ViewModel(displayedArticle: displayedArticle)
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
