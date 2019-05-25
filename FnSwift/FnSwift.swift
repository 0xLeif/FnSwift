//
//  FnSwift.swift
//  FnSwift
//
//  Created by Zach Eriksen on 5/23/19.
//  Copyright © 2019 ol. All rights reserved.
//

import Foundation

// MARK: Global Functions
@discardableResult
/// If True
public func fn_if(_ condition: Bool,
                  _ forTrue: (() -> Void)? = nil) -> Bool {
    let trueBlock = forTrue ?? {}
    condition ? trueBlock() : {}()
    return condition
}

@discardableResult
/// If False
public func fn_iff(_ condition: Bool,
                   _ forFalse: (() -> Void)? = nil) -> Bool {
    let falseBlock = forFalse ?? {}
    condition ? {}() : falseBlock()
    return condition
}

/// Switch
///switch 5 {
/// case 0:
///     print(4)
/// default:
///     print(-1)
///}
///
///fn_switch(5, [
///    0: { print(4) },
///    ],{
///        print(-1)
///})
public func fn_switch<T>(_ value: T,
                         _ cases: [T: () -> Void],
                         _ defaultCase: (() -> Void)? = nil) {
    let defaultBlock = defaultCase ?? {}
    let switchBlock = cases[value] ?? defaultBlock
    switchBlock()
}

public func fn_while(_ condition: () -> Bool,
                     _ action: () -> Void) {
    guard condition() else { return }
    
    action()
    
    fn_while(condition,
             action)
}

public func fn_for(_ count: Int,
                   by: Int = 1,
                   index: Int = 0,
                   _ action: (Int) -> Void) {
    guard index < count else { return }
    
    action(index)
    
    fn_for(count,
           by: by,
           index: index + by,
           action)
}

public func fn_until(_ count: Int,
                     by: Int = 1,
                     index: Int = 0,
                     _ action: (Int) -> Void) {
    fn_for(count + 1,
           by: by,
           index: index,
           action)
}
