//
//  ArticleInterfaces.swift
//  NYT
//
//  Created by Hanis Hassim on 04/07/2021.
//

protocol ArticleDisplayable: AnyObject {
    func displayArticleList(with viewModel: ArticleModels.ArticleViewModel)
    func displayArticleList(with error: ArticleModels.DataError)
}

protocol ArticleBusinessLogic {
    func getArticle(with type: ArticleViewModel.ArticleType)
}

protocol ArticlePresentable {
    func presentArticleList(with response: ArticleModels.ArticleResponse)
    func displayArticleList(with error: ArticleModels.DataError)
}
