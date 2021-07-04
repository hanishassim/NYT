//
//  NYTSearchTableViewCellViewModel.swift
//  NYT
//
//  Created by Hanis Hassim on 04/07/2021.
//

import Foundation

public protocol NYTSearchTableViewCellViewModelType {
    var titleText: Box<String?> { get }
    var subtitleText: Box<String?> { get }
    
    var buttonCompletion: Box<(() -> Void)?> { get }
}

class NYTSearchTableViewCellViewModel: NYTSearchTableViewCellViewModelType {
    public let titleText = Box<String?>(nil)
    public let subtitleText = Box<String?>(nil)
    
    public let buttonCompletion = Box<(() -> Void)?>(nil)
    
    required init() {
//        self.titleText.value = titleText
//        self.subtitleText.value = subtitle
    }
}
