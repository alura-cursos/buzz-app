//
//  NewsListViewController.swift
//  Buzz
//
//  Created by Giovanna Moeller on 29/05/24.
//

import UIKit

class NewsListViewController: UIViewController {

    private let interactor = NewsListInteractor()
    
    private lazy var newsListTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "PrimaryColor")
        //interactor.loadNews(request: NewsListModel.FetchNews.Request())
        addSubviews()
        setupConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(newsListTableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            newsListTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            newsListTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            newsListTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            newsListTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

extension NewsListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = "Notícia"
        cell.contentConfiguration = content
        return cell
    }
}


