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
    
    
    override func setUp(){
        super.setUp()
        //English
        loadStoredValues(for: "en")
        //Spanish
        loadStoredValues(for: "es")
    }

//    //Method to retrieve one specific localized string.
//    func localizeThisString(this value:String, in language:String) -> String{
//        let path = Bundle.main.path(forResource: language, ofType: "lproj")
//        let languageBundle = Bundle(path: path!)
//        return languageBundle!.localizedString(forKey: value, value: nil, table: nil)
//    }
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
    
    override func tearDown(){
        //TODO: remove from memory
    }

    func testEnglish(){
        XCTAssertEqual(enStrings["Loading"], enTestStrings["Loading"])
        XCTAssertEqual(enStrings["Error"], enTestStrings["Error"])
        XCTAssertEqual(enStrings["MarvelHeroesList"], enTestStrings["MarvelHeroesList"])

        XCTAssertNotEqual(enStrings["Loading"], esTestStrings["Loading"])

    }
  

}
