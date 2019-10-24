import Foundation

public extension String {

    var withSmartQuotes: String {
        String(zip(self, indices).map { (character, index) -> String.Element in
            guard Apostrophe.dumb.contains(character),
                let apostrophe = Apostrophe(rawValue: character) else { return character }
            return ApostropheConverter(
                apostrophe: apostrophe,
                string: self,
                index: index
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

    private struct ApostropheConverter {
        /// The apostrophe character under consideration for conversion
        var apostrophe: Apostrophe
        /// The full string under consideration
        var string: String
        /// The index of the apostrophe under consideration
        var index: String.Index

        var curlyApostrophe: String.Element {
            if precedingStringUntilWhitespace == nil {
                return apostrophe.open
            }
            return matchingApostrophe ? apostrophe.open : apostrophe.close
        }

        /// `true` if a matching closing apostrophe is found for the current apostrophe
        private var matchingApostrophe: Bool {
            let closers: [String.Element] = {
                switch apostrophe {
                case .singleDumb, .singleOpen: return [Apostrophe.singleDumb.rawValue, Apostrophe.singleClose.rawValue]
                case .doubleDumb, .doubleOpen: return [Apostrophe.doubleDumb.rawValue, Apostrophe.doubleClose.rawValue]
                case .singleClose, .doubleClose: return []
                }
            }()

            var closerCount = 0
            string[string.index(after: index)..<string.endIndex].forEach {
                if closers.contains($0) { closerCount += 1 }
            }
            return closerCount % 2 == 1
        }

        /// The string range before the character, but after any preceding whitespace
        private var precedingStringUntilWhitespace: String.SubSequence? {
            String(string[..<index].dropLast())
                .split(separator: " ", omittingEmptySubsequences: false)
                .last
        }
        /// The string range following the character, until the next whitespace
        private var followingStringUntilWhitespace: String.SubSequence? {
            String(string[index..<string.endIndex].dropFirst())
                .split(separator: " ", omittingEmptySubsequences: false)
                .first
        }
    }

}
