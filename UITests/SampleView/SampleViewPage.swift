// MIT License — Educational sample script
// Created by Angelina Latash on 10.09.25. for demonstration purposes only.
//

import XCTest

@MainActor
public struct SampleViewPage {
    
    private let application: XCUIApplication
    
    public var screen: XCUIElement {
        application.descendants(matching: .any)["SampleView_screen"]
    }
    
    public var button: XCUIElement {
        screen.children(matching: .any)["SampleView_button"]
    }
    
    public var text: XCUIElement {
        screen.staticTexts["SampleView_text"]
    }
    
    public init(application: XCUIApplication) {
        self.application = application
    }
}
