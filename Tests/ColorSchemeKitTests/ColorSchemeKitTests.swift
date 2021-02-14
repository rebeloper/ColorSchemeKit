import XCTest
@testable import ColorSchemeKit

final class ColorSchemeKitTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(ColorSchemeKit().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
