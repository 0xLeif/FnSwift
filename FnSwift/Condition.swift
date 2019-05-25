//
//  Condition.swift
//  FnSwift
//
//  Created by Zach Eriksen on 5/23/19.
//  Copyright © 2019 ol. All rights reserved.
//

import Foundation

public extension Bool {
    
    func `if`(_ block: () -> Bool) -> Bool {
        return self ? block() : self
    }
    
    @discardableResult
    func `true`(_ block: () -> Void) -> Bool {
        if self {
            block()
        }
        return self
    }
    
    func `false`(_ block: () -> Void) {
        if !self {
            block()
        }
    }
}

// MARK: Example Code
//(6 == 5)
//    .if { return 6 == 6 }
//    .true { print(true) }
//    .false { print(false) }
//
//
//let boolValue = "1234" == "1234"
//var count = 0
//
//boolValue.if {
//    count += 1
//    return count == 4
//    }.true {
//        count += 2
//    }.false {
//        count += 3
//}
//
//print(count)
//
//let isUserAuthenticated = false
//let isProcessing = false
//
//isUserAuthenticated
//    .if { !isProcessing }
//    .true { print("Login") }
//    .false { print("Blocked") }
//
//func test() {
//    print("Loaded")
//}
//
//isProcessing
//    .true { print("Loading...") }
//    .false(test)
