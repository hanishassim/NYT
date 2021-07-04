//
//  PaddedTextField.swift
//  NYT
//
//  Created by Hanis Hassim on 04/07/2021.
//

import UIKit

class PaddedTextField: UITextField {
    private var padding: UIEdgeInsets!
    
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
