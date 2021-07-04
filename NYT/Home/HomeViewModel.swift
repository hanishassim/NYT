//
//  HomeViewModel.swift
//  NYT
//
//  Created by Hanis Hassim on 03/07/2021.
//

protocol HomeViewModelType {
    var searchSection: Box<[NYTTableViewCellViewModel]> { get }
    var popularSection: Box<[NYTTableViewCellViewModel]> { get }
    
    init()
}

class HomeViewModel: HomeViewModelType {
    public let searchSection: Box<[NYTTableViewCellViewModel]> = {
        let searches: [String] = ["Search Articles"]
        var viewModels = [NYTTableViewCellViewModel]()
        
        for i in searches {
            viewModels.append(NYTTableViewCellViewModel(titleText: i))
        }
        
        return Box(viewModels)
    }()
    
    public let popularSection: Box<[NYTTableViewCellViewModel]> = {
        let searches: [String] = ["Most Viewed", "Most Shared", "Most Emailed"]
        var viewModels = [NYTTableViewCellViewModel]()
        
        for i in searches {
            viewModels.append(NYTTableViewCellViewModel(titleText: i))
        }
        
        return Box(viewModels)
    }()
    
    required init() { }
}
