//
//  ConditionTests.swift
//  FnSwiftTests
//
//  Created by Zach Eriksen on 5/24/19.
//  Copyright © 2019 ol. All rights reserved.
//

import XCTest

class ConditionTests: XCTestCase {

    func testTrueCondition_0() {
        let someBool = true
        
        someBool
            .true { assert(true) }
            .false { assert(false) }
    }
    
    func testTrueCondition_1() {
        let someBool = true
        
        someBool
            .if { 5 == 5 }
            .true { assert(true) }
            .false { assert(false) }
    }
    
    func testTrueCondition_2() {
        let someBool = true
        
        someBool
            .if { 5 != 5 }
            .true { assert(false) }
            .false { assert(true) }
    }
    
    func testFalseCondition_0() {
        let someBool = false
        
        someBool
            .true { assert(false) }
            .false { assert(true) }
    }
    
    func testFalseCondition_1() {
        let someBool = false
        
        someBool
            .if { 5 == 5 }
            .true { assert(false) }
            .false { assert(true) }
    }
    
    func testFalseCondition_2() {
        let someBool = false
        
        someBool
            .if { 5 != 5 }
            .true { assert(false) }
            .false { assert(true) }
    }

}
