//
//  File.swift
//  SampleTestFramework
//
//  Created by Angelina Latash on 10.09.25.
//

import XCTest
import TestSources

final class SampleViewUITests: UIBaseTest {
    
    private var page: SampleViewPage!
    
    override func setUp() async throws {
        launchEnvironment = "SampleView_screen"
        try await super.setUp()
        
        self.page = SampleViewPage(application: application)
    }
    
    override func tearDown() async throws {
        page = nil
        
        try await super.tearDown()
    }
    
    func test_SampleView_screen() {
        XCTAssertTrue(
            page.screen
                .waitForExistence(timeout: timeout)
        )
        
        XCTAssertEqual(page.text.label, "Hello, World!")
        
        page.button.tap()
        
        XCTAssertEqual(page.text.label, "Bye, World!")
    }
}
