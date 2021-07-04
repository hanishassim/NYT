//
//  ObjectDataSource.swift
//  NYT
//
//  Created by Hanis Hassim on 03/07/2021.
//

import UIKit

class ObjectTableSource: NSObject, UITableViewDataSource {

    var objects = [CellInfo(sectionTitle: "Search", sectionData: ["Search Articles"])]
    
    var identifier = "Cell"
    
    required override init() {
        super.init()
        
        objects.append(CellInfo(sectionTitle: "Popular", sectionData: ["Most Viewed", "Most Shared", "Most Emailed"]))
    }
    
    // MARK: - Table View
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return objects.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects[safe: section]?.sectionData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? NYTTableViewCell<NYTTableViewCellViewModel>,
              let title = objects[safe: indexPath.section]?.sectionData?[indexPath.row] else { return UITableViewCell() }
        
        let viewModel = NYTTableViewCellViewModel(titleText: title)
        
        cell.configureWith(value: viewModel)
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 60 : 40
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return objects[safe: section]?.sectionTitle
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        
        header.textLabel?.font = .boldSystemFont(ofSize: 16)
        header.textLabel?.textColor = .white
    }
}
