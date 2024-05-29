//
//  NewsListViewController.swift
//  Buzz
//
//  Created by Giovanna Moeller on 29/05/24.
//

import UIKit

class NewsListViewController: UIViewController {

    private let interactor = NewsListInteractor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        interactor.loadNews()
    }


}

