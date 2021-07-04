//
//  ArticleInteractor.swift
//  NYT
//
//  Created by Hanis Hassim on 04/07/2021.
//

class ArticleInteractor: ArticleBusinessLogic {
    func getArticle(with type: ArticleViewModel.ArticleType) {
        switch type {
        case .mostEmailed:
            break
        case .mostViewed:
            break
        case .mostShared:
            break
        case .withKeyword(let keyword):
            break
        }
    }
}
