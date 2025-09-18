// MIT License — Educational sample script
// Created by Angelina Latash on 10.09.25. for demonstration purposes only.
//

@preconcurrency import XCTest

@MainActor
open class UITestCaseBase: XCTestCase {
    
    private(set) var application: XCUIApplication!
    
    let defaultTimeout: TimeInterval = 4.0
    
    var launchEnvironment: String!
    
    open override func setUp() async throws {
        try await super.setUp()
        
        continueAfterFailure = false

        application = await MainActor.run { [launchEnvironment] () -> XCUIApplication in
            let app = XCUIApplication()
            app.launchEnvironment["DEMO_START_SCREEN"] = launchEnvironment
            app.launch()
            return app
        }
    }

    open override func tearDown() async throws {
        await MainActor.run {
            application?.terminate()
            application = nil
        }
        
        try await super.tearDown()
    }
}
