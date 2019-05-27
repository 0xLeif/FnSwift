//
//  KeyPathObjectTests.swift
//  FnSwiftTests
//
//  Created by Zach Eriksen on 5/27/19.
//  Copyright © 2019 ol. All rights reserved.
//

import XCTest
import UIKit
@testable import FnSwift

class KeyPathObjectTests: XCTestCase {

    func testKeyPathBackgroundColor() {
        let view = UIView() ~ \.backgroundColor + .red
        
        assert(view.backgroundColor == .red)
    }
    
    func testTwoKeyPaths() {
        let view = (UIView() ~ \.layer.borderColor + UIColor.blue.cgColor)
                            ~ \.layer.borderWidth + 3
        
        assert(view.layer.borderColor == UIColor.blue.cgColor)
        assert(view.layer.borderWidth == 3)
    }
    
    func testKeyPath() {
        let someButton = UIButton()
        
        someButton ~ \.gestureRecognizers + [UITapGestureRecognizer()]
        
        assert(!(someButton.gestureRecognizers ?? []).isEmpty)
    }

}
