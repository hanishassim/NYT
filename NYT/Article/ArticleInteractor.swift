//
//  ArticleInteractor.swift
//  NYT
//
//  Created by Hanis Hassim on 04/07/2021.
//

import Alamofire

class ArticleInteractor: ArticleBusinessLogic {
    
    var presenter: ArticlePresentable?
    
    init(presenter: ArticlePresentable) {
        self.presenter = presenter
    }
    
    func getArticle(with type: ArticleViewModel.ArticleType) {
        switch type {
        case .mostEmailed:
            let url = "\(API.host)/svc/mostpopular/v2/emailed/1.json?api-key=\(API.nytApiKey)"

            AF.request(url)
                .validate()
                .responseDecodable(of: ArticleListInfo.self) { [weak self] response in
                    guard let strongSelf = self, let value = response.value else { return }
                    
                    strongSelf.presenter?.presentArticleList(with: ArticleModels.ArticleListResponse(article: value.results))
                }
        case .mostViewed:
            let url = "\(API.host)/svc/mostpopular/v2/shared/1/facebook.json?api-key=\(API.nytApiKey)"
            
            AF.request(url)
                .validate()
                .responseDecodable(of: ArticleListInfo.self) { [weak self] response in
                    guard let strongSelf = self, let value = response.value else { return }
                    
                    strongSelf.presenter?.presentArticleList(with: ArticleModels.ArticleListResponse(article: value.results))
                }
        case .mostShared:
            let url = "\(API.host)/svc/mostpopular/v2/viewed/1.json?api-key=\(API.nytApiKey)"
            
            AF.request(url)
                .validate()
                .responseDecodable(of: ArticleListInfo.self) { [weak self] response in
                    guard let strongSelf = self, let value = response.value else { return }
                    
                    strongSelf.presenter?.presentArticleList(with: ArticleModels.ArticleListResponse(article: value.results))
                }
        case .withKeyword(let keyword):
            let url = "\(API.host)/svc/search/v2/articlesearch.json?q=\(keyword)&api-key=\(API.nytApiKey)"
            
            AF.request(url)
                .validate()
                .responseDecodable(of: SearchArticleInfo.self) { [weak self] response in
                    guard let strongSelf = self, let value = response.value else { return }
                    
                    strongSelf.presenter?.presentArticleList(with: ArticleModels.SearchArticleResponse(article: value.response?.docs))
                }
        }
    }
}
