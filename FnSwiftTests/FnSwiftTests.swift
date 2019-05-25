//
//  FnSwiftTests.swift
//  FnSwiftTests
//
//  Created by Zach Eriksen on 5/23/19.
//  Copyright © 2019 ol. All rights reserved.
//

import XCTest
@testable import FnSwift

class FnSwiftTests: XCTestCase {
    
    func testIfTrue() {
        let someBool = true
        
        fn_if(someBool) { assert(true) }
            .false { assert(false) }
    }
    
    func testIfFalse() {
        let someBool = false
        
        fn_if(someBool) { assert(false) }
            .true { assert(true) }
    }
    
    func testIffTrue() {
        let someBool = true
        
        fn_iff(someBool) { assert(false) }
            .false { assert(true) }
    }
    
    func testIffFalse() {
        let someBool = false
        
        fn_iff(someBool) { assert(true) }
            .true { assert(false) }
    }
    
    func testForCountTo10() {
        let answer = 10
        
        var count = 0
        
        fn_for(10) { _ in
            count += 1
        }
        
        assert(count == answer)
    }
    
    func testUntilCountTo10() {
        let answer = 10
        
        var count = 0
        
        fn_until(9) { _ in
            count += 1
        }
        
        assert(count == answer)
    }
    
    func testWhileCountTo10() {
        let answer = 10
        
        var count = 0
        
        fn_while({ count < answer }) {
            count += 1
        }
        
        assert(count == answer)
    }
    
    func testSwitchDefault() {
        let randomNumber = Int.random(in: 0 ... 1000)
        
        fn_switch(randomNumber, [:]) {
            assert(true)
        }
    }
    
    
    func testSwitchCase_0() {
        let number = 246
        
        fn_switch(number, [
            246: { assert(true) },
            135: { assert(false) }
        ]) {
            assert(false)
        }
    }
    
    func testSwitchCase_1() {
        let number = 246
        
        let cases = [
            246: { assert(true) },
            135: { assert(false) }
        ]
        
        fn_switch(number, cases) {
            assert(false)
        }
    }
    
    
}

/*
 func testPerformanceExample() {
 // This is an example of a performance test case.
 self.measure {
 // Put the code you want to measure the time of here.
 }
 }
 */
