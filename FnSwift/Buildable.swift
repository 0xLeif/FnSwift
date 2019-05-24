//
//  Buildable.swift
//  FnSwift
//
//  Created by Zach Eriksen on 5/23/19.
//  Copyright © 2019 ol. All rights reserved.
//

import Foundation


public protocol Buildable {
    init()
    init(_ build: (inout Self) -> Void)
    static func +(_ lhs: inout Self, _ block: (inout Self) -> Void) -> Void
}

public extension Buildable {
    
    init(_ build: (inout Self) -> Void) {
        var s = Self()
        build(&s)
        self = s
    }
    
    static func +(_ lhs: inout Self, _ block: (inout Self) -> Void) -> Void {
        var s = lhs
        block(&s)
        lhs = s
    }
}

// MARK: Example Code
//struct Pet {
//    var name: String
//    var age: Int
//    var owner: Person?
//}
//
//extension Pet: Buildable {
//    init() {
//        self = Pet(name: "N/A", age: 0, owner: nil)
//    }
//}
//
//struct Person {
//    var name: String
//    var age: Int
//}
//
//extension Person: Buildable {
//    init() {
//        self = Person(name: "N/A", age: 0)
//    }
//}
//
//var test = Person()
//test.name = "Jabroni"
//test.age = 34
//
//let test2 = Person( { (person) -> Void in
//    person.name = "leif"
//    person.age = 23
//})
//
//print(test2)
//
//var petOne = Pet {
//    return $0
//}
//petOne + {
//    $0.name = "New NAME"
//}
//
//
//print(petOne)
//
//
//func print(person: Person) {
//    print("Printing: \(person)")
//}
//
//print(person: Person {
//    $0.name = "Nice"
//})
