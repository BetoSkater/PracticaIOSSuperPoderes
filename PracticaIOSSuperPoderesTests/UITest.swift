//
//  UITest.swift
//  PracticaIOSSuperPoderesTests
//
//  Created by Alberto Junquera Ramírez on 2/4/23.
//

import XCTest
import ViewInspector
import SwiftUI
@testable import PracticaIOSSuperPoderes

//extension CircularProgressViewStyle: Equatable{
//    public static func == (lhs: CircularProgressViewStyle, rhs: CircularProgressViewStyle) -> Bool {
//        if lhs == rhs{
//            return true
//        }else{
//            return false
//        }
//
//    }
//}

final class UITest: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
     //MARK: -  LoadingScreen - 
    
    /// Method to thest the LoadingView() UI.
    func testLoadingScreen() throws{
        let view = LoadingView()
        ///Localization must be retrieved  in order to check the progressBar Text.
        @Environment(\.locale) var localizedLanguage
        let language = (localizedLanguage.language.languageCode?.identifier)!
        
        let progressBarLocalizedText = Tool.shared.localizeThisString(this: "Loading", in: language)
        
        let loadingLabel = try view.inspect().find(viewWithId: 0)
        XCTAssertNotNil(loadingLabel)
        let loadingLabelText = try loadingLabel.text().string()
        
        XCTAssertEqual(progressBarLocalizedText, loadingLabelText)
        
        ///Test to check if the LoadingView progressBar() is circular.
        let loadingBar = try view.inspect().find(viewWithId: 1)
        XCTAssertNotNil(loadingBar)
        
        //        let loadingBarStyle = try loadingBar.progressViewStyle() as! CircularProgressViewStyle
        //        let expectedBarStyle = CircularProgressViewStyle(tint: .red)
        //        XCTAssertEqual(loadingBarStyle, expectedBarStyle)
        
    }
    
    //MARK: - HeroCard -
    
    /// Method to test the HeroeCard Viee designed with ViewBuilder
    func testHeroeCardViewBuilder() throws{
        //MARK: - setUp -
        let thumbnail = Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/6/30/4ce69c2246c21", thumbnailExtension: .jpg)
        
        let heroe = Heroe(id: 12345, name: "Storm", description: "She can control the weather", thumbnail: thumbnail)
        
        let view = HeroeCard(content: {
            ZStack{}
        }, heroe: heroe)
        
        XCTAssertNotNil(view)
        
        /// View body only returns one view, so the itemCount is one. Is true that this unique view can have subviews, but view.inspect().count takes into account only the body property.
        let itemsCount = try view.inspect().count
        XCTAssertEqual(itemsCount, 1)
        
        //MARK: - HeroeCard Image test -
        
        ///Test to check if the url generated from the thumbnail is the same that is used in the asyncImage.
        let thumbnailURL = Tool.shared.ThumbnailToURLConverter(this: heroe.thumbnail, withAspect: .portraitUncanny)
        
        let heroeCardImage = try view.inspect().find(viewWithId: 1)
        XCTAssertNotNil(heroeCardImage)
        let heroeCardImageURL = try heroeCardImage.asyncImage().url()
        XCTAssertEqual(thumbnailURL, heroeCardImageURL)
        
        //MARK: - HeroeCard Name test -
        
        ///Test to check the name assigment.
        let heroeCardName = try view.inspect().find(viewWithId: 2)
        XCTAssertNotNil(heroeCardName)
        
        let heroeCardNameText = try heroeCardName.text().string()
        
        XCTAssertEqual(heroeCardNameText, heroe.name)
    }
    
    //MARK: - HeroeSeriesView -
    
    /// Method to test the HeroeSeriesView.
    func testHeroeSeriesView() throws{
        ///TestView creation:
        let thumbnail = Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/6/30/4ce69c2246c21", thumbnailExtension: .jpg)
        
        let heroe = Heroe(id: 12345, name: "Storm", description: "She can control the weather", thumbnail: thumbnail)
        
        let view = HeroeSeriesView(heroesSeriesViewModel: HeroeSeriesViewModel(heroe: heroe), heroe: heroe).environmentObject(HeroesTableViewModel())
        
        ///Checking that the NavigationStack has loaded data.
        let navigationStack = try view.inspect().find(viewWithId: 0)
        XCTAssertNotNil(navigationStack)
        
        let navigationStackIsEmpty = try navigationStack.navigationStack().isEmpty
        XCTAssertEqual(navigationStackIsEmpty, false)
        
        ///Checking the List existance.
        let listView = try  view.inspect().find(viewWithId: 1)
        _ = try listView.parent()
        
        XCTAssertNotNil(listView)
        // XCTAssertEqual(listViewParent, navigationStack)
    }
    
    //MARK: - SerieCard ViewBuilder -
    
    /// Method to test the SerieCard Viee designed with ViewBuilder.
    func testSerieCardViewBuilder() throws{
        //MARK: - setUp -
        let thumbnail = Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/6/30/4ce69c2246c21", thumbnailExtension: nil)
        
        let serie = Serie(id: 12345, title: "SpiderMan", description: nil, thumbnail: thumbnail)
        
        let view = SerieCard(content: {
            ZStack{}
        }, serie: serie)
        
        XCTAssertNotNil(view)
        
        /// View body only returns one view, so the itemCount is one. Is true that this unique view can have subviews, but view.inspect().count takes into account only the body property.
        let itemsCount = try view.inspect().count
        XCTAssertEqual(itemsCount, 1)
        
        //MARK: - SerieCard Image test -
        
        ///Test to check if the url generated from the thumbnail is the same that is used in the asyncImage.
        let thumbnailURL = Tool.shared.ThumbnailToURLConverter(this: serie.thumbnail, withAspect: .portraitUncanny)
        
        let serieCardImage = try view.inspect().find(viewWithId: 0)
        XCTAssertNotNil(serieCardImage)
        let serieCardImageURL = try serieCardImage.asyncImage().url()
        XCTAssertEqual(thumbnailURL, serieCardImageURL)
        
        //MARK: - SerieCard Title test -
        
        ///Test to check the title assigment.
        let serieCardTitle = try view.inspect().find(viewWithId: 2)
        XCTAssertNotNil(serieCardTitle)
        
        let serieCardTitleText = try serieCardTitle.text().string()
        
        XCTAssertEqual(serieCardTitleText, serie.title)
        
        //MARK: - SerieCard description test -
        ///Test to check the description assigment. The serie used has a nil description, in order to compare values, the localized string for the DescriptionNil must be retrieved.
        ///First, the languege used by the emulator must be retrieved. Afterwards, the localized string for the DescriptionNil value is gathered.
        @Environment(\.locale) var localizedLanguage
        let language = (localizedLanguage.language.languageCode?.identifier)!
        
        let descriptionNil = Tool.shared.localizeThisString(this: "DescriptionNil", in: language)
        
        ///Retrieving the description value presented in the SerieCard.
        let serieCardDescription = try view.inspect().find(viewWithId: 1)
        XCTAssertNotNil(serieCardDescription)
        let serieCardDescriptionText = try serieCardDescription.text().string()
        
        XCTAssertEqual(serieCardDescriptionText, descriptionNil)
    }
}
