//
//  HomeRouter.swift
//  NYT
//
//  Created by Hanis Hassim on 03/07/2021.
//

import UIKit

struct HomeRouter {
    weak var viewController: UIViewController?
}

extension HomeRouter: HomeRoutable {
    func navigateToSearch() {
        let vc = SearchViewController(viewModel: SearchViewModel())
        
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func navigateToArticleList(_ type: ArticleViewModel.ArticleType) {
        let vc = ArticleViewController(viewModel: ArticleViewModel(with: type))
        
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
