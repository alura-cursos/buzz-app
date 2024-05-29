//
//  NewsListDetails.swift
//  Buzz
//
//  Created by Giovanna Moeller on 29/05/24.
//

import Foundation

struct NewsListDetailsModel {
    struct FetchNewsDetails {
        struct Request {
            let id: Int
        }
        struct Response {
            let article: Article?
        }
        struct ViewModel {
            struct DisplayedArticle {
                let title: String
                let author: String
                let description: String
                let content: String
                let url: URL
                let imageUrl: URL
                let publishedAt: String
            }
            let displayedArticle: DisplayedArticle
        }
    }
}
