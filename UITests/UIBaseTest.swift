@preconcurrency import XCTest

@MainActor
open class UIBaseTest: XCTestCase {
    
    let timeout: TimeInterval = 5.0
    
    private(set) var application: XCUIApplication!
    
    var launchEnvironment: String!
    
    open override func setUp() async throws {
        try await super.setUp()
        
        continueAfterFailure = false

        application = await MainActor.run { [launchEnvironment] () -> XCUIApplication in
            let app = XCUIApplication()
            app.launchEnvironment["UITEST_SCREEN"] = launchEnvironment
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
