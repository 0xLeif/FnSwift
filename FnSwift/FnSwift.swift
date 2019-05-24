//
//  FnSwift.swift
//  FnSwift
//
//  Created by Zach Eriksen on 5/23/19.
//  Copyright © 2019 ol. All rights reserved.
//

import Foundation

// MARK: Fn Static Class
public class Fn {
    static func `if`() {
        
    }
}

// MARK: Global Functions
@discardableResult
public func fn_if(_ condition: Bool,
                  true forTrue: (() -> Void)? = nil,
                  else forFalse: (() -> Void)? = nil) -> Bool {
    let trueBlock = forTrue ?? {}
    let falseBlock = forFalse ?? {}
    condition ? trueBlock() : falseBlock()
    return condition
}

public func fn_for(times: Int,
                   do: (Int) -> Void) {
    
}
