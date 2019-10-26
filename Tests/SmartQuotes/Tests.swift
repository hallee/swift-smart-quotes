import XCTest
@testable import SmartQuotes

final class SmartQuotesTests: XCTestCase {

    private let testCases: [String: String] = [
        "'93": "’93",
        "\"'93\"": "“’93”",
        "'90s 'high crime'": "’90s ‘high crime’",
        "and then she blurted, \"I thought you said, 'I don't like '80s music'?\"":
            "and then she blurted, “I thought you said, ‘I don’t like ’80s music’?”",
        "and then she blurted, \"I thought you said, 'I like '80s music'?\"":
            "and then she blurted, “I thought you said, ‘I like ’80s music’?”",
        "aren't": "aren’t",
        "'em": "’em",
        "\"Europe's debt crisis\": not good":
            "“Europe’s debt crisis”: not good",
        "Founders ask themselves: \"Why can't we get features out the door like we used to in the early days?\"":
            "Founders ask themselves: “Why can’t we get features out the door like we used to in the early days?”",
        "got 'em": "got ’em",
        "\"got 'em\"": "“got ’em”",
        "rock 'n' roll": "rock ’n’ roll",
        "she's got 'em": "she’s got ’em",
        "she’s got 'em": "she’s got ’em",
        "ma'am": "ma’am",
        "'ma'am'": "‘ma’am’"
    ]

    func testSmartQuotes() {
        for (variable, expected) in testCases {
            XCTAssertEqual(variable.withSmartQuotes, expected)
        }
    }

}
