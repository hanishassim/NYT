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
           let topViewController = navigationController?.topViewController  {
            let config = SFSafariViewController.Configuration()
            let vc = SFSafariViewController(url: url, configuration: config)
            
            topViewController.navigationController?.pushViewController(vc, animated: true)
        } else {
            guard UIApplication.shared.canOpenURL(url) else { return }
            
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
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
