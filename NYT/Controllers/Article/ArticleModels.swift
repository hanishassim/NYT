//
//  ArticleModels.swift
//  NYT
//
//  Created by Hanis Hassim on 04/07/2021.
//

public enum ArticleModels {
    public struct SearchArticleResponse {
        var article: [ArticleInfoDoc]?
    }
    
    public struct ArticleListResponse {
        var article: [ArticleListInfoResponse]?
    }
    
    public struct ArticleViewModel {
        var articleViewModels: [NYTTableViewCellViewModel]
    }
    
    public struct DataError {
        let error: Error
    }
}
