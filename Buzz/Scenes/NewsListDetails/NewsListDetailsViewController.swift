//
//  NewsListDetailsViewController.swift
//  Buzz
//
//  Created by Giovanna Moeller on 29/05/24.
//

import UIKit

protocol NewsListDetailsDisplayLogic: AnyObject {
    func displayFetchedNews(viewModel: NewsListDetailsModel.FetchNewsDetails.ViewModel)
    func displayError(message: String)
}

class NewsListDetailsViewController: UIViewController {

    var articleId: Int
    var interactor: NewsListDetailsBusinessLogic?
    
    private lazy var articleTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 22.0, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
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
        setup()
        fetchNewsById()
        addSubviews()
        setupConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(articleTitleLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            articleTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            articleTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.0),
            articleTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16.0),
        ])
    }
    
    private func fetchNewsById() {
        interactor?.loadNewsFromId(request: NewsListDetailsModel.FetchNewsDetails.Request(id: articleId))
    }
    
    private func setup() {
        let viewController = self
        let interactor = NewsListDetailsInteractor()
        let presenter = NewsListDetailsPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }

}

extension NewsListDetailsViewController: NewsListDetailsDisplayLogic {
    func displayFetchedNews(viewModel: NewsListDetailsModel.FetchNewsDetails.ViewModel) {
        articleTitleLabel.text = viewModel.displayedArticle.title
    }
    
    func displayError(message: String) {
        print(message)
    }
}
