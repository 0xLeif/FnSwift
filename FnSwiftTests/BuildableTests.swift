//
//  BuildableTests.swift
//  FnSwiftTests
//
//  Created by Zach Eriksen on 5/24/19.
//  Copyright © 2019 ol. All rights reserved.
//

import XCTest
@testable import FnSwift

struct Person {
    var name: String
    var age: Int
}

extension Person: Buildable {
    init() {
        self = Person(name: "N/A", age: 0)
    }
}

class BuildableTests: XCTestCase {
    
    func testPersonBuilderVerbose() {
        let person = Person( { (person) -> Void in
            person.name = "Leif"
            person.age = 23
        })
        
        assert(person.name == "Leif")
        assert(person.age == 23)
    }
    
    func testPersonBuilderShort() {
        let person = Person {
            $0.name = "Leif"
            $0.age = 23
        }
        
        assert(person.name == "Leif")
        assert(person.age == 23)
    }
    
    func testPersonBuilderOperator() {
        var person = Person {
            $0.name = "Leif"
            $0.age = 23
        }
        
        person ... {
            $0.age += 1
        }
        
        assert(person.name == "Leif")
        assert(person.age == 24)
    }

}
