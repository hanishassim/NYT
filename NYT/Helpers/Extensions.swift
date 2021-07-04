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
            vc.preferredControlTintColor = .darkGray
            
            topViewController.navigationController?.present(vc, animated: true, completion: nil)
        } else {
            guard UIApplication.shared.canOpenURL(url) else { return }
            
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}

extension DateFormatter {
    static let formatter = DateFormatter()
    
    static func convert(currentDateInString: String, dateFormat: String = "yyyy-MM-dd'T'HH:mm:ssZ") -> Date? {
        DateFormatter.formatter.dateFormat = dateFormat
        
        return DateFormatter.formatter.date(from: currentDateInString)
    }
}

extension Date {
    func toString(dateFormat: String = "EEEE, d MMMM yyyy") -> String {
        let isToday = Calendar.current.isDateInToday(self)
        
        if isToday {
            DateFormatter.formatter.dateFormat = "d MMMM yyyy"
            
            let result = DateFormatter.formatter.string(from: self)
            let customString = "Today, \(result)"
            
            return customString
        } else {
            DateFormatter.formatter.dateFormat = dateFormat
            
            return DateFormatter.formatter.string(from: self)
        }
    }
}
