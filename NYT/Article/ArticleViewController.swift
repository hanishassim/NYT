//
//  ArticleViewController.swift
//  NYT
//
//  Created by Hanis Hassim on 03/07/2021.
//

import UIKit

class ArticleViewController<ViewModel>: UIViewController, UITableViewDelegate where ViewModel: ArticleViewModelType {
    
    // MARK: - Properties -
    // MARK: Internal
    
    var rootView: ArticleView {
        return view as! ArticleView
    }
    
    // MARK: Private
    
    private(set) var viewModel: ViewModel
    
    private var dataSource = ArticleListDataSource()
    
    // MARK: - Initializer and Lifecycle Methods -
    
    public init(viewModel: ViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func loadView() {
        view = ArticleView(frame: UIScreen.main.bounds)
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupListeners()
    }
    
    private func setupViews() {
        title = "Articles"
        
        rootView.tableView.register(NYTTableViewCell<NYTTableViewCellViewModel>.self, forCellReuseIdentifier: dataSource.identifier)
        
        rootView.tableView.dataSource = dataSource
        rootView.tableView.delegate = self
    }
    
    private func setupListeners() {
        viewModel.articles.bind { [weak self] in
            guard let strongSelf = self else { return }
            
            strongSelf.dataSource.setData(objects: $0)
            strongSelf.rootView.tableView.reloadData()
        }
        
        viewModel.articleFetchError.bind { [weak self] in
            guard let strongSelf = self else { return }
            
            print($0.debugDescription)
        }
    }
    
    // MARK: - Table View Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let url = dataSource.objects?[safe: indexPath.row]?.url.value else { return }
        
        presentWebView(for: url)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

