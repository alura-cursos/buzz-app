//
//  NewsListViewController.swift
//  Buzz
//
//  Created by Giovanna Moeller on 29/05/24.
//

import UIKit

protocol NewsListDisplayLogic: AnyObject {
    func displayFetchedNews(viewModel: NewsListModel.FetchNews.ViewModel)
    func displayError(message: String)
}

class NewsListViewController: UIViewController {

    var interactor: NewsListBusinessLogic?
    var router: NewsListRoutingLogic?
    
    var displayedArticles: [NewsListModel.FetchNews.ViewModel.DisplayedArticle] = []
    
    private lazy var newsListTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NewsListArticleCell.self, forCellReuseIdentifier: NewsListArticleCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "PrimaryColor")
        setup()
        fetchNews()
        addSubviews()
        setupConstraints()
    }
    
    private func setup() {
        let viewController = self
        let interactor = NewsListInteractor()
        let presenter = NewsListPresenter()
        self.router = NewsListRouter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
        router?.viewController = viewController
    }
    
    private func fetchNews() {
        interactor?.loadNews(request: NewsListModel.FetchNews.Request())
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
        return displayedArticles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsListArticleCell.identifier, for: indexPath) as? NewsListArticleCell else { return UITableViewCell() }
        cell.configure(with: displayedArticles[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let article = displayedArticles[indexPath.row]
        router?.routeToNewsDetail(articleId: article.id)
    }
}

extension NewsListViewController: NewsListDisplayLogic {
    func displayFetchedNews(viewModel: NewsListModel.FetchNews.ViewModel) {
        self.displayedArticles = viewModel.displayedArticles
        newsListTableView.reloadData()
    }
    
    func displayError(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
