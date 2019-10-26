import Foundation

public extension String {

    var withSmartQuotes: String {
        var string = self
        /// 'n'
        string = string.replacingOccurrences(of: #"'n'"#, with: "’n’", options: .regularExpression)
        /// triple prime
        string = string.replace("'''", with: "‴")
        /// beginning "
        string = string.replace(#"(\W|^)"(\S)"#, with: "$1“$2")
        /// ending "
        string = string.replace(#"(“[^"]*)"([^"]*$|[^“"]*“)"#, with: "$1”$2")
        /// remaining " at end of word
        string = string.replace(#"([^\d])""#, with: "$1”")
        /// double prime
        string = string.replace("''", with: "″")
        /// year abbreviations
        string = string.replace(#"'(\d\ds?)"#, with: #"’$1"#)
        /// beginning '
        string = string.replace(#"(\W|^)'(\S)"#, with: "$1‘$2")
        /// possession
        string = string.replace(#"([a-z])'([a-z])"#, with: "$1’$2")
        /// ending '
        string = string.replace(#"((‘[^']*)|[a-z])'([^\d]|$)"#, with: "$1’$3")
        /// backwards apostrophe
        string = string.replace(#"(\B|^)‘(?=([^‘’]*’\b)*([^‘’]*\B\W[‘’]\b|[^‘’]*$))"#, with: "$1’")
        /// double prime
        string = string.replace("\"", with: "″")
        /// prime
        string = string.replace("'", with: "′")
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

}
