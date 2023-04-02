//
//  LocalizableTest.swift
//  PracticaIOSSuperPoderesTests
//
//  Created by Alberto Junquera Ramírez on 22/3/23.
//

import XCTest

final class LocalizableTest: XCTestCase {
    //Get values from localizable
    var enStrings:[String:String] = [:]
    var esStrings:[String:String] = [:]
    
    //Test Values
    let enTestStrings:[String:String] = ["Loading":"Loading data",
                                         "Error":"Error",
                                         "MarvelHeroesList":"Marvel Characters"]
    let esTestStrings:[String:String] = ["Loading":"Cargando...",
                                         "Error":"Error",
                                         "MarvelHeroesList":"Personajes de Marvel"]
    
    ///SetUp method to load some localized strings in two languages,
    override func setUp(){
        super.setUp()
        //English
        loadStoredValues(for: "en")
        //Spanish
        loadStoredValues(for: "es")
    }
    
    ///Method used to load the localized strings in spanish, english or in the default language.
    func loadStoredValues(for language:String){
        if language == "es"{
            esStrings["Loading"] = Tool.shared.localizeThisString(this: "Loading", in: "es")
            esStrings["Error"] = Tool.shared.localizeThisString(this: "Error", in: "es")
            esStrings["MarvelHeroesList"] = Tool.shared.localizeThisString(this: "MarvelHeroesList", in: "es")
        }else{
            enStrings["Loading"] = Tool.shared.localizeThisString(this: "Loading", in: "en")
            enStrings["Error"] = Tool.shared.localizeThisString(this: "Error", in: "en")
            enStrings["MarvelHeroesList"] = Tool.shared.localizeThisString(this: "MarvelHeroesList", in: "en")
        }
    }
    ///Method that actually test the localized english strings.
    func testEnglish(){
        XCTAssertEqual(enStrings["Loading"], enTestStrings["Loading"])
        XCTAssertEqual(enStrings["Error"], enTestStrings["Error"])
        XCTAssertEqual(enStrings["MarvelHeroesList"], enTestStrings["MarvelHeroesList"])
        XCTAssertNotEqual(enStrings["Loading"], esTestStrings["Loading"])
    }
}
