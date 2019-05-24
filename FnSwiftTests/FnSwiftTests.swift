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

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        
        
        fn_for(5) { (i) in
            print(i)
        }
        
        fn_until(5) { (i) in
            print(i)
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
