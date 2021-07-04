//
//  ArticleViewModel.swift
//  NYT
//
//  Created by Hanis Hassim on 03/07/2021.
//

import Foundation

protocol ArticleViewModelType {
    var type: Box<ArticleViewModel.ArticleType> { get }
    
    var articles: Box<[NYTTableViewCellViewModel]?> { get }
    var articleFetchError: Box<Error?> { get }
}

class ArticleViewModel: ArticleViewModelType {
    enum ArticleType {
        case mostViewed
        case mostShared
        case mostEmailed
        case withKeyword(_ keyword: String)
    }
    
    public let type = Box<ArticleType>(.mostViewed)
    
    public let articles = Box<[NYTTableViewCellViewModel]?>(nil)
    public let articleFetchError = Box<Error?>(nil)
    
    private var interactor: ArticleBusinessLogic!
    
    convenience init(with type: ArticleType) {
        self.init()
        
        interactor = ArticleInteractor(presenter: ArticlePresenter(viewController: self))
        
        self.type.value = type
        
        interactor.getArticle(with: type)
    }
}

extension ArticleViewModel: ArticleDisplayable {
    func displayArticleList(with viewModel: ArticleModels.ArticleViewModel) {
        articles.value = viewModel.articleViewModels
    }
    
    func displayArticleList(with error: ArticleModels.DataError) {
        articleFetchError.value = error.error
    }
}
