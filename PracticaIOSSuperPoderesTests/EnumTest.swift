//
//  EnumTest.swift
//  PracticaIOSSuperPoderesTests
//
//  Created by Alberto Junquera Ramírez on 26/3/23.
//

import XCTest

final class EnumTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func testStatesEnum() throws{
        let states: [Status] = [.none,.loadedHeroes,.loadedSeries,.loading,.error(errorMsg: "Testing Error Message")]
        
        XCTAssertNotNil(states)
        
        XCTAssertEqual(states[0], .none)
        XCTAssertEqual(states[3], .loading)
        
        XCTAssertNotEqual(states[1], .none)
        XCTAssertNotEqual(states[3], .loadedHeroes)
        
        XCTAssertNotEqual(states[3], .error(errorMsg: "Test Error"))
    
        
    }

}
