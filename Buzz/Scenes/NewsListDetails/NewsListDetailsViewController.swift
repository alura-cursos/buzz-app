//
//  NewsListDetailsViewController.swift
//  Buzz
//
//  Created by Giovanna Moeller on 29/05/24.
//

import UIKit

class NewsListDetailsViewController: UIViewController {

    var articleId: Int
    
    init(articleId: Int) {
        self.articleId = articleId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "PrimaryColor")
    }

}
