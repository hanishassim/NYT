//
//  ViewController.swift
//  NYT
//
//  Created by Hanis Hassim on 03/07/2021.
//

import UIKit

class HomeViewController<ViewModel>: UIViewController, UITableViewDelegate where ViewModel: HomeViewModelType {

    // MARK: - Properties -
    // MARK: Internal
    
    var rootView: HomeView {
        return view as! HomeView
    }
    
    // MARK: Private
    
    private(set) lazy var viewModel: ViewModel = ViewModel()
    private lazy var router: HomeRoutable = HomeRouter(viewController: self)

    private var dataSource = ObjectTableSource()
    
    // MARK: - Initializer and Lifecycle Methods -
    
    public init(viewModel: ViewModel) {
        
        super.init(nibName: nil, bundle: nil)
        
        self.viewModel = viewModel
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func loadView() {
        view = HomeView(frame: UIScreen.main.bounds)
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupListeners()
    }
    
    private func setupViews() {
        title = "NYT"
        
        rootView.tableView.register(NYTTableViewCell<NYTTableViewCellViewModel>.self, forCellReuseIdentifier: dataSource.identifier)
        
        rootView.tableView.dataSource = dataSource
        rootView.tableView.delegate = self
    }
    
    private func setupListeners() {
//        viewModel.searchSection.bind
    }
    
    // MARK: - Table View Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let title = dataSource.objects[safe: indexPath.section]?.sectionData?[indexPath.row]
        
        switch title?.lowercased() {
        case "Search Articles".lowercased():
            router.navigateToSearch()
        case "Most Viewed".lowercased():
            router.navigateToArticleList(.mostViewed)
        case "Most Shared".lowercased():
            router.navigateToArticleList(.mostShared)
        case "Most Emailed".lowercased():
            router.navigateToArticleList(.mostEmailed)
        default: break
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

