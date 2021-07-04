//
//  SearchDataSource.swift
//  NYT
//
//  Created by Hanis Hassim on 04/07/2021.
//

import UIKit

class SearchDataSource: NSObject, UITableViewDataSource {
    
    var identifier = "Cell"
    
    required override init() {
        super.init()
    }
    
    // MARK: - Table View
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? NYTSearchTableViewCell<NYTSearchTableViewCellViewModel> else { return UITableViewCell() }
        
        cell.configureWith(value: NYTSearchTableViewCellViewModel())
        
        return cell
    }
}

