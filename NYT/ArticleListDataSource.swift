//
//  ArticleListDataSource.swift
//  NYT
//
//  Created by Hanis Hassim on 04/07/2021.
//

import UIKit

class ArticleListDataSource: NSObject, UITableViewDataSource {

    var objects = [ArticleInfo(url: nil, title: "A", description: "B")]
    
    var identifier = "Cell"
    
    required override init() {
        super.init()
        
        objects.append(ArticleInfo(url: nil, title: "A", description: "B"))
    }
    
    // MARK: - Table View
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? NYTTableViewCell<NYTTableViewCellViewModel>,
              let title = objects[safe: indexPath.row]?.title,
              let subtitle = objects[safe: indexPath.row]?.description else { return UITableViewCell() }
        
        let viewModel = NYTTableViewCellViewModel(titleText: title, subtitle: subtitle)
        
        cell.configureWith(value: viewModel)
        cell.accessoryType = .detailButton
        
        return cell
    }
}
