//
//  Extensions.swift
//  NYT
//
//  Created by Hanis Hassim on 03/07/2021.
//

import UIKit
import SafariServices

extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

extension URL {
    var isHttpScheme: Bool {
        return self.scheme?.lowercased() == "http" || self.scheme?.lowercased() == "https"
    }
}

extension UIViewController {
    func presentWebView(for url: URL) {
        if #available(iOS 11.0, *),
           url.isHttpScheme,
           let topViewController = navigationController?.topViewController {
            let config = SFSafariViewController.Configuration()
            let vc = SFSafariViewController(url: url, configuration: config)
            
            topViewController.navigationController?.present(vc, animated: true, completion: nil)
        } else {
            guard UIApplication.shared.canOpenURL(url) else {
                presentAppUnavailableAlert()
                
                return
            }
            
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    private func presentAppUnavailableAlert() {
        let alertController = UIAlertController(title: "NYT App is not installed.", message: "You can view the webpage instead", preferredStyle: .alert)
        alertController.view.tintColor = .darkGray
        let okAction = UIAlertAction(title: "View Webpage", style: .default, handler: { [weak self] _ in
            guard let strongSelf = self else { return }
            
            strongSelf.presentWebView(for: URL(string: "https://google.com")!)
        })
        alertController.addAction(okAction)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
}

class PaddedTextField: UITextField {
    private(set) var padding: UIEdgeInsets!
    
    required init(padding: UIEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)) {
        super.init(frame: .zero)
        
        self.padding = padding
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
