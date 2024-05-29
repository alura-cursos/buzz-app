//
//  NewsListArticleCell.swift
//  Buzz
//
//  Created by Giovanna Moeller on 29/05/24.
//

import UIKit
import Kingfisher

class NewsListArticleCell: UITableViewCell {
    static let identifier = "NewsListArticleCell"

    private let articleAuthorLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let articleTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "PrimaryColor")
        return label
    }()
    
    private let articleDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let articleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let articleTimestampLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        contentView.addSubview(articleAuthorLabel)
        contentView.addSubview(articleImageView)
        contentView.addSubview(articleTitleLabel)
        contentView.addSubview(articleDescriptionLabel)
        contentView.addSubview(articleTimestampLabel)
    }

    private func setupConstraints() {
        let padding: CGFloat = 10

        NSLayoutConstraint.activate([
            articleAuthorLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            articleAuthorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            articleAuthorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            
            articleTitleLabel.topAnchor.constraint(equalTo: articleAuthorLabel.bottomAnchor, constant: padding),
            articleTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            articleTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),

            articleDescriptionLabel.topAnchor.constraint(equalTo: articleTitleLabel.bottomAnchor, constant: padding),
            articleDescriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            articleDescriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),

            articleImageView.topAnchor.constraint(equalTo: articleDescriptionLabel.bottomAnchor, constant: padding),
            articleImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            articleImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            articleImageView.heightAnchor.constraint(equalToConstant: 200),

            articleTimestampLabel.topAnchor.constraint(equalTo: articleImageView.bottomAnchor, constant: padding),
            articleTimestampLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            articleTimestampLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding),
            articleTimestampLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding)
        ])
    }

    func configure(with article: NewsListModel.FetchNews.ViewModel.DisplayedArticle) {
        articleAuthorLabel.text = article.author
        articleTitleLabel.text = article.title
        articleDescriptionLabel.text = article.description
        articleTimestampLabel.text = article.publishedAt
        articleImageView.kf.setImage(with: article.imageUrl)
    }
}

