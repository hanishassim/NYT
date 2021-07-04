//
//  ArticlePresenter.swift
//  NYT
//
//  Created by Hanis Hassim on 04/07/2021.
//

struct ArticlePresenter {
    private weak var viewController: ArticleDisplayable?
    
    init(viewController: ArticleDisplayable) {
        self.viewController = viewController
    }
}

extension ArticlePresenter: ArticlePresentable {
    func presentArticleList(with response: ArticleModels.ArticleListResponse) {
        guard let articles = response.article, articles.count > 0 else { return }
        
        var list = [NYTTableViewCellViewModel]()
        
        list = articles.map {
            return NYTTableViewCellViewModel(titleText: $0.title ?? "", subtitle: $0.published_date, url: $0.uri ?? $0.url)
        }
        
        let viewModel = ArticleModels.ArticleViewModel(articleViewModels: list)
        
        viewController?.displayArticleList(with: viewModel)
    }
    
    func presentArticleList(with response: ArticleModels.SearchArticleResponse) {
        guard let articles = response.article, articles.count > 0 else { return }
        
        var list = [NYTTableViewCellViewModel]()
        
        list = articles.map {
            return NYTTableViewCellViewModel(titleText: $0.snippet ?? "", subtitle: $0.abstract, url: $0.web_url)
        }
        
        let viewModel = ArticleModels.ArticleViewModel(articleViewModels: list)
        
        viewController?.displayArticleList(with: viewModel)
    }
    
    func displayArticleList(with error: ArticleModels.DataError) {
        
    }
}
