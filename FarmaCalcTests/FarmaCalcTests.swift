//
//  FarmaCalcTests.swift
//  FarmaCalcTests
//
//  Created by Breno Rezende on 17/06/21.
//

import XCTest
@testable import FarmaCalc

class FarmaCalcTests: XCTestCase {
    
    func testAllColor() {
        let colors = UIColor.allCustomColors
        XCTAssert(colors.count == 9)
    }
}
