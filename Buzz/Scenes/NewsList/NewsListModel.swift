//
//  NewsListModel.swift
//  Buzz
//
//  Created by Giovanna Moeller on 29/05/24.
//

import Foundation

struct NewsListModel {
    struct FetchNews {
        struct Request {}
        struct Response {
            let articles: [Article]
        }
        struct ViewModel {
            struct DisplayedArticle {
                let id: Int
                let title: String
                let author: String
                let description: String?
                let publishedAt: String
                let imageUrl: URL
            }
            let displayedArticles: [DisplayedArticle]
        }
    }
}
