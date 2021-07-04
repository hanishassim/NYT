//
//  SearchViewController.swift
//  NYT
//
//  Created by Hanis Hassim on 03/07/2021.
//

import UIKit

class SearchViewController<ViewModel>: UIViewController, UITableViewDelegate, NYTSearchTableViewCellDelegate where ViewModel: SearchViewModelType {
    
    // MARK: - Properties -
    // MARK: Internal
    
    var rootView: SearchView {
        return view as! SearchView
    }
    
    // MARK: Private
    
    private(set) lazy var viewModel: ViewModel = ViewModel()
    private lazy var router: HomeRoutable = HomeRouter(viewController: self)
    
    private var dataSource = SearchDataSource()
    
    // MARK: - Initializer and Lifecycle Methods -
    
    public init(viewModel: ViewModel) {
        
        super.init(nibName: nil, bundle: nil)
        
        self.viewModel = viewModel
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func loadView() {
        view = SearchView(frame: UIScreen.main.bounds)
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupListeners()
    }
    
    private func setupViews() {
        title = "Search"
        
        rootView.tableView.register(NYTSearchTableViewCell<NYTSearchTableViewCellViewModel>.self, forCellReuseIdentifier: dataSource.identifier)

        rootView.tableView.dataSource = dataSource
        rootView.tableView.delegate = self
    }
    
    private func setupListeners() {
//        viewModel.searchSection.bind
    }
    
    // MARK: - Table View Delegate
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let cell = cell as? NYTSearchTableViewCell<NYTSearchTableViewCellViewModel> {
            cell.delegate = self
        }
    }
    
    // MARK: - NYTSearchTableViewCellDelegate
    
    func didTapSearch() {
        router.navigateToArticleList(.withKeyword(keyword: "Hello"))
    }
}
