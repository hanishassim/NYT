//
//  ArticleListDataSource.swift
//  NYT
//
//  Created by Hanis Hassim on 04/07/2021.
//

import UIKit

class ArticleListDataSource: NSObject, UITableViewDataSource {

    var objects: [NYTTableViewCellViewModel]?// = [ArticleInfo(url: nil, title: "A", description: "B")]
    
    var identifier = "Cell"
    
    required override init() {
        super.init()
        
//        objects.append(ArticleInfo(url: nil, title: "A", description: "B"))
    }
    
    func setData(objects: [NYTTableViewCellViewModel]?) {
        self.objects = objects
    }
    
    // MARK: - Table View
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? NYTTableViewCell<NYTTableViewCellViewModel>,
              let viewModel = objects?[safe: indexPath.row] else { return UITableViewCell() }
        
        cell.configureWith(value: viewModel)
        cell.accessoryType = .detailButton
        
        return cell
    }
}
