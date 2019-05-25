//
//  KeyPathObject.swift
//  FnSwift
//
//  Created by Zach Eriksen on 5/23/19.
//  Copyright © 2019 ol. All rights reserved.
//

import Foundation

precedencegroup KeyPathPrecedence {
    associativity: right
    higherThan: MultiplicationPrecedence
}

infix operator ~: KeyPathPrecedence

@discardableResult
public func set<T,E>(obj: inout T, path: ReferenceWritableKeyPath<T, E>, value: E) -> T {
    obj[keyPath: path] = value
    return obj
}

public class KPObject<T,E> {
    var obj: T
    var path: ReferenceWritableKeyPath<T, E>
    
    init(obj: T, path: ReferenceWritableKeyPath<T, E>) {
        self.obj = obj
        self.path = path
    }
}

public func ~<T,E>(obj: T, path: ReferenceWritableKeyPath<T, E>) -> KPObject<T, E> {
    return KPObject(obj: obj, path: path)
}

public func ~<T,E>(obj: KPObject<T,E>, path: ReferenceWritableKeyPath<T, E>)  -> KPObject<T, E> {
    obj.path = path
    return obj
}

public func +<T,E>(obj: KPObject<T,E>, value: E) -> T {
    var o = obj.obj
    set(obj: &o, path: obj.path, value: value)
    return o
}

// MARK: Example Code

//var v = UIView()
//
//let view: UIView = v ~ \.backgroundColor + .red
//
//
//((v ~ \.layer.cornerRadius + 3)
//    ~ \.backgroundColor + .blue)
//    ~ \.layer.borderWidth + 6
//
//print(v.backgroundColor)
