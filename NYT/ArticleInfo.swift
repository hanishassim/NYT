//
//  ArticleInfo.swift
//  NYT
//
//  Created by Hanis Hassim on 04/07/2021.
//

import Foundation

struct SearchArticleInfo: Codable {
    var status: String?
    var response: ArticleInfoResponse?
}

struct ArticleInfoResponse: Codable {
    var docs: [ArticleInfoDoc]?
}

struct ArticleInfoDoc: Codable {
    var abstract: String?
    var web_url: URL?
    var uri: URL?
    var snippet: String?
    var lead_paragraph: String?
}

struct ArticleListInfo: Codable {
    var status: String?
    var results: [ArticleListInfoResponse]?
}

struct ArticleListInfoResponse: Codable {
    var title: String?
    var published_date: String?
    var url: URL?
    var uri: URL?
}
