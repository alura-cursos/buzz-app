//
//  NewsListRouter.swift
//  Buzz
//
//  Created by Giovanna Moeller on 29/05/24.
//

import UIKit

protocol NewsListRoutingLogic {
    var viewController: NewsListViewController? { get set }
    func routeToNewsDetail(articleId: Int)
}

class NewsListRouter: NewsListRoutingLogic {
    
    weak var viewController: NewsListViewController?
    
    static func createInitialViewController() -> UIViewController {
        let newsListViewController = NewsListViewController()
        let navigationController = UINavigationController(rootViewController: newsListViewController)
        return navigationController
    }
    
    func routeToNewsDetail(articleId: Int) {
        let detailVC = NewsListDetailsViewController(articleId: articleId)  
        viewController?.navigationController?.pushViewController(detailVC, animated: true)
    }
}
