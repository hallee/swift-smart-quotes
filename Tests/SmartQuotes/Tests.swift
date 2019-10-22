import XCTest
@testable import SmartQuotes

final class SmartQuotesTests: XCTestCase {

    private let testCases: [String: String] = [
        "'93": "’93",
        "\"'93\"": "“’93”",
        "'em": "’em",
        "Aren't": "Aren’t",
        "Got 'em": "Got ’em"
    ]

    func testSmartQuotes() {
        for (variable, expected) in testCases {
            XCTAssertEqual(variable.withSmartQuotes, expected)
        }
    }

}
