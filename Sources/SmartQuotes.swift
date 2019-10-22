import Foundation

public extension String {

    var withSmartQuotes: String {
        String(zip(self, indices).map { (character, index) -> String.Element in
            guard Apostrophe.all.contains(character) else { return character }
            let preceding = String(self[..<index].dropLast())
            let following = String(self[index..<endIndex].dropFirst())
            return Cluster(
                apostrophe: character,
                precedingStringUntilWhitespace: preceding,
                followingStringUntilWhitespace: following
            ).curlyApostrophe
        })
    }

    private enum Apostrophe: String.Element, RawRepresentable, CaseIterable {
        case single = "'"
        case double = "\""

        static var all: [String.Element] {
            allCases.map { $0.rawValue }
        }
    }

    private struct Cluster {
        /// The apostrophe character under consideration for conversion
        var apostrophe: String.Element
        /// The string range before the character, but after any preceding whitespace
        var precedingStringUntilWhitespace: String?
        /// The string range following the character, until the next whitespace
        var followingStringUntilWhitespace: String?

        var curlyApostrophe: String.Element {
            apostrophe /// TODO
        }
    }

}
