import XCTest
@testable import SmartQuotes

final class SmartQuotesTests: XCTestCase {

    private let testCases: [String: String] = [
        "'93": "’93",
        "\"'93\"": "“’93”",
        "and then she blurted, \"I thought you said, 'I don't like '80s music'?\"":
            "and then she blurted, “I thought you said, ‘I don’t like ’80s music’?”",
        "and then she blurted, \"I thought you said, 'I like '80s music'?\"":
            "and then she blurted, “I thought you said, ‘I like ’80s music’?”",
        "aren't": "aren’t",
        "'em": "’em",
        "\"Europe's debt crisis\": not good":
            "“Europe’s debt crisis”: not good",
        "got 'em": "got ’em",
        "\"got 'em\"": "“got ’em”",
        "she's got 'em": "she’s got ’em",
        "ma'am": "ma’am",
        "'ma'am'": "‘ma’am’"
    ]

    func testSmartQuotes() {
        for (variable, expected) in testCases {
            XCTAssertEqual(variable.withSmartQuotes, expected)
        }
    }

}
