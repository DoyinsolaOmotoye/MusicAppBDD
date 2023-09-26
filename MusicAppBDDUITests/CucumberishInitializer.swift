//
//  CucumberishInitializer.swift
//  MusicAppBDDUITests
//
//  Created by Temitope Gabriel Molomo  on 22/09/2023.
//

import XCTest
import Foundation
import Cucumberish
@testable import MusicAppBDD

extension XCUIElement {
    func forceTapElement() {
        if self.isHittable {
            self.tap()
        }
        else {
            let coordinate: XCUICoordinate = self.coordinate(withNormalizedOffset: CGVector(dx:0.0, dy:0.0))
            coordinate.tap()
        }
    }
}

public class CucumberishInitializer: NSObject {
    
    @objc class func setupCucumberish() {
        
        before({ _ in
            
            //
            
            Given("I launch the application and the playlist is empty") { args, _ in
                XCUIApplication().launch()
            }
            
            When("I click on the menu icon on a song titled \"The Best Jazz Club In New Orleans\" list item and I click on the \"add to playlist\" button") { args, _ in
                
                //                let task = (args?[0])!
                //
                //                let taskTextField = XCUIApplication().textFields["taskTextFields"]
                //                taskTextField.tap()
                //                taskTextField.typeText(task + "\n")
                //                XCUIApplication().buttons.element(boundBy: 4).tap()
                let menuButton = XCUIApplication().buttons.element(boundBy: 3)
                XCTAssertTrue(menuButton.exists)
                XCTAssertTrue(menuButton.isHittable)
                menuButton.tap()
                
                // Add a brief delay to allow the menu to appear
                sleep(1)
                
                // Now you can interact with the menu items
                let menuItem = XCUIApplication().buttons["addSongButton1"] // Replace with the actual menu item's accessibility identifier
                XCTAssertTrue(menuItem.exists)
                XCTAssertTrue(menuItem.isHittable)
                
                // Tap on the menu item
                menuItem.tap()
                //                XCUIApplication().buttons["addSongButton1"].tap()
                
                
            }
            
            Then("I should see one song added to the playlist") { _, _ in
                
                let expectedCount = 1
                
                XCUIApplication().tabBars.buttons.element(boundBy: 1).forceTapElement()
                
                let list = XCUIApplication().tables.element(boundBy: 3)
//                XCTAssertTrue(list.exists)
                
                let count = list.children(matching: .cell).count
                
                XCTAssertEqual(expectedCount, count)
                
            }
            
        })
        
        let bundle = Bundle(for: CucumberishInitializer.self)
        
        Cucumberish.executeFeatures(inDirectory: "Features", from: bundle, includeTags: nil, excludeTags: nil)
        
    }
    
}
