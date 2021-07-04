//
//  Box.swift
//  NYT
//
//  Created by Hanis Hassim on 03/07/2021.
//

public class Box<T> {
    public typealias Listener = (T) -> Void
    private var listener: Listener?
    
    public var value: T {
        didSet {
            listener?(value)
        }
    }
    
    public init(_ value: T) {
        self.value = value
    }
    
    public func bind(_ listener: Listener?) {
        self.listener = listener
        
        listener?(value)
    }
}
