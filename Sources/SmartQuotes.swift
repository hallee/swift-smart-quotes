import Foundation

public extension String {

    var withSmartQuotes: String {
        String(zip(self, indices).map { (character, index) -> String.Element in
            guard Apostrophe.dumb.contains(character),
                let apostrophe = Apostrophe(rawValue: character) else { return character }
            let preceding = String(self[..<index].dropLast())
                .split(separator: " ", omittingEmptySubsequences: true)
                .last
            let following = String(self[index..<endIndex].dropFirst())
                .split(separator: " ", omittingEmptySubsequences: true)
                .first
            return Cluster(
                apostrophe: apostrophe,
                precedingStringUntilWhitespace: preceding,
                followingStringUntilWhitespace: following
            ).curlyApostrophe
        })
    }

    private enum Apostrophe: String.Element, RawRepresentable, CaseIterable {
        case singleDumb = "'"
        case doubleDumb = "\""

        case singleOpen = "‘"
        case doubleOpen = "“"

        case singleClose = "’"
        case doubleClose = "”"

        static var dumb: [String.Element] {
            [singleDumb.rawValue, doubleDumb.rawValue]
        }

        static var all: [String.Element] {
            allCases.map { $0.rawValue }
        }

        /// The curly open variety of this apostrophe, if this apostrophe is a ‘dumb’ one.
        var open: String.Element {
            switch self {
            case .singleDumb: return Apostrophe.singleOpen.rawValue
            case .doubleDumb: return Apostrophe.doubleOpen.rawValue
            default: return rawValue
            }
        }

        /// The curly close variety of this apostrophe, if this apostrophe is a ‘dumb’ one.
        var close: String.Element {
            switch self {
            case .singleDumb: return Apostrophe.singleClose.rawValue
            case .doubleDumb: return Apostrophe.doubleClose.rawValue
            default: return rawValue
            }
        }
    }

    private struct Cluster {
        /// The apostrophe character under consideration for conversion
        var apostrophe: Apostrophe
        /// The string range before the character, but after any preceding whitespace
        var precedingStringUntilWhitespace: String.SubSequence?
        /// The string range following the character, until the next whitespace
        var followingStringUntilWhitespace: String.SubSequence?

        var curlyApostrophe: String.Element {
            if precedingStringUntilWhitespace == nil {
                return open
            } else {
                return apostrophe.close
            }
        }

        private var open: String.Element {
            if let lastCharacterFollowingApostrophe = followingStringUntilWhitespace?.last {
                if Apostrophe.all.contains(lastCharacterFollowingApostrophe) {
                    return apostrophe.open
                } else {
                    return apostrophe.close
                }
            }
            return apostrophe.open
        }
    }

}
