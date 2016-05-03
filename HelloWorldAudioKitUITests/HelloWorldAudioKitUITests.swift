//
//  HelloWorldAudioKitUITests.swift
//  HelloWorldAudioKitUITests
//
//  Created by Michael Mecham on 4/27/16.
//  Copyright © 2016 MichaelMecham. All rights reserved.
//

import XCTest


class HelloWorldAudioKitUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testHomeView() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        
        let app = XCUIApplication()
        app.childrenMatchingType(.Window).elementBoundByIndex(0).childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Other).elementBoundByIndex(1).swipeLeft()
        app.images["iPhone 6 Plus"].tap()
        snapshot("1Screen")
        sleep(4)
        
        let tablesQuery = app.tables
        tablesQuery.staticTexts["A Maj"].pressForDuration(0.7);
        snapshot("2Screen")
        
        
        
        
        

        
    }
    
}
