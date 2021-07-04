//
//  HomeInterfaces.swift
//  NYT
//
//  Created by Hanis Hassim on 03/07/2021.
//

protocol HomeRoutable {
    func navigateToSearch()
    func navigateToArticleList(_ type: ArticleViewModel.ArticleType)
}
