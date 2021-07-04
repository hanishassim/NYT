//
//  NYTTableViewCell.swift
//  NYT
//
//  Created by Hanis Hassim on 03/07/2021.
//

import UIKit

public class NYTTableViewCell<ViewModel>: UITableViewCell where ViewModel: NYTTableViewCellViewModelType {
    
    // MARK: - Properties -
    // MARK: Private
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var viewModel: NYTTableViewCellViewModelType = NYTTableViewCellViewModel(titleText: "")
    
    // MARK: - Initializer and Lifecycle Methods -
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        accessoryType = .disclosureIndicator
        
        setupViews()
        setupListeners()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    private func setupViews() {
        contentView.addSubview(separatorView)
        
        NSLayoutConstraint.activate([
            separatorView.leadingAnchor.constraint(equalTo: leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: trailingAnchor),
            separatorView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            separatorView.heightAnchor.constraint(equalToConstant: 0.5)
        ])
    }
    
    private func setupListeners() {
        viewModel.titleText.bind { [weak self] in
            guard let strongSelf = self else { return }
            
            strongSelf.textLabel?.text = $0
        }
        
        viewModel.subtitleText.bind { [weak self] in
            guard let strongSelf = self else { return }
            
            strongSelf.detailTextLabel?.text = $0
        }
    }
    
    public func configureWith(value: Any) {
        guard let value = value as? ViewModel else { return }
        
        self.viewModel = value
        
        setupListeners()
    }
}
