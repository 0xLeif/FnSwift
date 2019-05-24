//
//  Configurable.swift
//  FnSwift
//
//  Created by Zach Eriksen on 5/23/19.
//  Copyright © 2019 ol. All rights reserved.
//

import Foundation

postfix operator ...

public protocol Configurable {
    func configure<T>(_ configure: (inout T) -> Void) -> T
    static func ...<T>(_ lhs: Self, _ block: (inout T) -> Void) -> T
}

public extension Configurable {
    
    static func ... <T>(lhs: Self, block: (inout T) -> Void) -> T {
        return lhs.configure(block)
    }
    
    func configure<T>(_ configure: (inout T) -> Void) -> T {
        var build = self as! T
        configure(&build)
        return build
    }
}

// MARK: Example Implementation

//extension UIView: Configurable {}

// MARK: Example Code

//let backgroundView: UIView = UIView() ... {
//    $0.backgroundColor = .blue
//}
//
//let label: UILabel = UILabel() ... {
//    $0.text = "Hello World"
//}
//
//let label2: UILabel = UILabel().configure() {
//    $0.text = "Hello World"
//}
