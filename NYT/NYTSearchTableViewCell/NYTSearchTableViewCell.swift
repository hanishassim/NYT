//
//  NYTSearchTableViewCell.swift
//  NYT
//
//  Created by Hanis Hassim on 04/07/2021.
//

import UIKit

public protocol NYTSearchTableViewCellDelegate: AnyObject {
    func didTapSearch(with keyword: String)
}

public class NYTSearchTableViewCell<ViewModel>: UITableViewCell where ViewModel: NYTSearchTableViewCellViewModelType {
    
    // MARK: - Properties -
    // MARK: Public
    
    public weak var delegate: NYTSearchTableViewCellDelegate?
    
    // MARK: Private
    
    lazy var textField: PaddedTextField = {
        let textField = PaddedTextField()
        textField.placeholder = "Search articles here .."
        textField.borderStyle = .line
        textField.backgroundColor = .white
        textField.layer.cornerRadius = cornerRadius
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 1
        textField.layer.masksToBounds = true
        textField.tintColor = .black
        textField.clearButtonMode = .whileEditing
        textField.returnKeyType = .next
        textField.autocorrectionType = .no
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Search", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 32, bottom: 0, right: 32)
        button.backgroundColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.layer.cornerRadius = cornerRadius
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [textField, button])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 24
        return stackView
    }()
    
    private var viewModel: NYTSearchTableViewCellViewModelType = NYTSearchTableViewCellViewModel()
    
    // MARK: - Initializer and Lifecycle Methods -
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
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
        backgroundColor = .clear
        selectionStyle = .none
        
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            textField.heightAnchor.constraint(equalToConstant: 44),

            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 60),
            stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            button.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    private func setupListeners() {
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
//        viewModel.titleText.bind { [weak self] in
//            guard let strongSelf = self else { return }
//
//            strongSelf.textLabel?.text = $0
//        }
//
//        viewModel.subtitleText.bind { [weak self] in
//            guard let strongSelf = self else { return }
//
//            strongSelf.detailTextLabel?.text = $0
//        }
    }
    
    public func configureWith(value: Any) {
        guard let value = value as? ViewModel else { return }
        
        self.viewModel = value
        
        setupListeners()
    }
    
    @objc private func buttonTapped() {
        guard let keyword = textField.text, !keyword.isEmpty else { return }
        
        delegate?.didTapSearch(with: keyword)
    }
}
