//
//  ToolTest.swift
//  PracticaIOSSuperPoderesTests
//
//  Created by Alberto Junquera Ramírez on 1/4/23.
//

import XCTest

final class ToolTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testTool() throws{
        let thumbnail = Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/6/30/4ce69c2246c21", thumbnailExtension: .jpg)
        
        let thumbnailPathNil = Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/6/30/4ce69c2246c21", thumbnailExtension: nil)
        
        let url = Tool.shared.ThumbnailToURLConverter(this: thumbnail, withAspect: .portraitIncredible)
        let urlPathNil = Tool.shared.ThumbnailToURLConverter(this: thumbnailPathNil, withAspect: .portraitIncredible)
       
        XCTAssertNotNil(url)
        XCTAssertEqual(url.pathExtension, "jpg")
        XCTAssertEqual(url, URL(string: url.description))
        XCTAssertEqual(urlPathNil.pathExtension, "jpg")
        
        
    }
}
