import XCTest
@testable import SmartQuotes

final class SmartQuotesTests: XCTestCase {

    private let testCases: [String: String] = [
        "'93": "’93",
        "\"'93\"": "“’93”",
        "Aren't": "Aren’t",
        "'em": "’em",
        "Got 'em": "Got ’em",
        "\"Got 'em\"": "“Got ’em”"
    ]

    func testSmartQuotes() {
        for (variable, expected) in testCases {
            XCTAssertEqual(variable.withSmartQuotes, expected)
        }
    }

}
