//
//  ModelsTest.swift
//  PracticaIOSSuperPoderesTests
//
//  Created by Alberto Junquera Ramírez on 1/4/23.
//

import XCTest

final class ModelsTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    //MARK: - Heroe Model Testing -
    
    func testHeroeModel() throws{
        
        let thumbnail = Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/6/30/4ce69c2246c21", thumbnailExtension: .jpg)
        
        let heroe = Heroe(id: 12345, name: "Storm", description: "She can control the weather", thumbnail: thumbnail)
        
        XCTAssertNotNil(thumbnail)
        XCTAssertEqual(thumbnail.thumbnailExtension, .jpg)
        XCTAssertEqual(thumbnail.path.isEmpty, false )
        
        XCTAssertNotNil(heroe)
        XCTAssertNotEqual(heroe.id, 54321)
        XCTAssertEqual(heroe.name, "Storm")
        XCTAssertEqual(heroe.description.isEmpty, false)
        XCTAssertNotNil(heroe.thumbnail)
        

    }
    
    
    //MARK: - Serie Model Tessting -
    func testSerieModel() throws{
        
        let thumbnail = Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/6/30/4ce69c2246c21", thumbnailExtension: nil)
        
        let serie = Serie(id: 12345, title: "Twin Peaks", description: nil, thumbnail: thumbnail)
        
        XCTAssertNotNil(thumbnail)
        XCTAssertEqual(thumbnail.thumbnailExtension, nil)
        XCTAssertEqual(thumbnail.path.isEmpty, false )
        
        XCTAssertNotNil(serie)
        XCTAssertNotEqual(serie.id, 54321)
        XCTAssertEqual(serie.title, "Twin Peaks")
        XCTAssertEqual(serie.description?.isEmpty, nil)
        XCTAssertNotNil(serie.thumbnail)
        

    }
}
