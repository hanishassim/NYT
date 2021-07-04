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
    
    private var dataSource = HomeTableSource()
    
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
    }
    
    private func setupViews() {
        title = "NYT"
        
        rootView.tableView.register(NYTTableViewCell<NYTTableViewCellViewModel>.self, forCellReuseIdentifier: dataSource.identifier)
        
        rootView.tableView.dataSource = dataSource
        rootView.tableView.delegate = self
    }
    
    // MARK: - Table View Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let title = dataSource.objects[safe: indexPath.section]?.sectionData?[indexPath.row]
        
        switch title {
        case HomeSections.search:
            router.navigateToSearch()
        case HomeSections.mostViewed:
            router.navigateToArticleList(.mostViewed)
        case HomeSections.mostShared:
            router.navigateToArticleList(.mostShared)
        case HomeSections.mostEmailed:
            router.navigateToArticleList(.mostEmailed)
        default: break
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        
        header.textLabel?.font = .boldSystemFont(ofSize: 16)
        header.textLabel?.textColor = .white
    }
}

