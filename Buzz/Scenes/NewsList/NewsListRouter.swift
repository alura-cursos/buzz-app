//
//  NewsListRouter.swift
//  Buzz
//
//  Created by Giovanna Moeller on 29/05/24.
//

import UIKit

class NewsListRouter {
    static func createInitialViewController() -> UIViewController {
        let newsListViewController = NewsListViewController()
        let navigationController = UINavigationController(rootViewController: newsListViewController)
        return navigationController
    }
}
