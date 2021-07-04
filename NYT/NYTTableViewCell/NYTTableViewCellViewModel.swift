//
//  NYTTableViewCellViewModel.swift
//  NYT
//
//  Created by Hanis Hassim on 03/07/2021.
//

import Foundation

public protocol NYTTableViewCellViewModelType {
    var titleText: Box<String?> { get }
    var subtitleText: Box<String?> { get }
}

class NYTTableViewCellViewModel: NYTTableViewCellViewModelType {
    public let titleText = Box<String?>(nil)
    public let subtitleText = Box<String?>(nil)
    
    required init(titleText: String, subtitle: String? = nil) {
        self.titleText.value = titleText
        self.subtitleText.value = subtitle
    }
}
