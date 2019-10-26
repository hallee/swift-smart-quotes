import Foundation

public extension String {

    var withSmartQuotes: String {
        withSmartQuotes(nil)
    }

    func withSmartQuotes(_ locale: Locale?) -> String {
        let openApostrophe = Mark.openApostrophe.localized(locale)
        let closeApostrophe = Mark.closeApostrophe.localized(locale)
        let openQuote = Mark.openQuotation.localized(locale)
        let closeQuote = Mark.closeQuotation.localized(locale)
        let prime = Mark.prime.localized(locale)
        let doublePrime = Mark.doublePrime.localized(locale)
        let triplePrime = Mark.triplePrime.localized(locale)

        var string = self
        /// 'n'
        string = string.replace(#"'n'"#, with: "\(closeApostrophe)n\(closeApostrophe)")
        /// triple prime
        string = string.replace("'''", with: "\(triplePrime)")
        /// beginning "
        string = string.replace(#"(\W|^)"(\S)"#, with: "$1\(openQuote)$2")
        /// ending "
        string = string.replace(#"(“[^"]*)"([^"]*$|[^“"]*“)"#, with: "$1\(closeQuote)$2")
        /// remaining " at end of word
        string = string.replace(#"([^\d])""#, with: "$1\(closeQuote)")
        /// double prime
        string = string.replace("''", with: "\(doublePrime)")
        /// year abbreviations
        string = string.replace(#"'(\d\ds?)"#, with: "\(closeApostrophe)$1")
        /// beginning '
        string = string.replace(#"(\W|^)'(\S)"#, with: "$1\(openApostrophe)$2")
        /// possession
        string = string.replace(#"([a-z])'([a-z])"#, with: "$1\(closeApostrophe)$2")
        /// ending '
        string = string.replace(#"((‘[^']*)|[a-z])'([^\d]|$)"#, with: "$1\(closeApostrophe)$3")
        /// backwards apostrophe
        string = string.replace(#"(\B|^)‘(?=([^‘’]*’\b)*([^‘’]*\B\W[‘’]\b|[^‘’]*$))"#, with: "$1\(closeApostrophe)")
        /// double prime
        string = string.replace("\"", with: "\(doublePrime)")
        /// prime
        string = string.replace("'", with: "\(prime)")
        return string
    }

    private func replace(
        _ pattern: String,
        with replacement: String
    ) -> String {
        return self.replacingOccurrences(
            of: pattern,
            with: replacement,
            options: [.regularExpression, .caseInsensitive]
        )
    }

    private enum Mark {
        case openApostrophe
        case closeApostrophe
        case openQuotation
        case closeQuotation
        case prime
        case doublePrime
        case triplePrime

        func localized(_ locale: Locale?) -> String {
            switch self {
            case .openApostrophe:
                switch locale?.languageCode {
                case "de": return "‚"
                case "fi", "sv": return "’"
                default: return "‘"
                }
            case .closeApostrophe:
                switch locale?.languageCode {
                case "de": return "‘"
                default: return "’"
                }
            case .openQuotation:
                switch locale?.languageCode {
                case "de": return "„"
                case "fi", "sv": return "”"
                default: return "“"
                }
            case .closeQuotation:
                switch locale?.languageCode {
                case "de": return "“"
                default: return "”"
                }
            case .prime: return "′"
            case .doublePrime: return "″"
            case .triplePrime: return "‴"
            }
        }
    }

}
