import Foundation

public extension String {

    var withSmartQuotes: String {
        var string = self
        string = string.replaceApostrophes
        return string
    }

    private var replaceApostrophes: String {
        var string = self
//        string = string.replacingOccurrences(of: #"'n'"#, with: "’n’", options: .regularExpression)
        string = string.replacingOccurrences(of: "'''", with: "‴")
        string = string.replacingOccurrences(of: #"(\W|^)"(\w)"#, with: "", options: .regularExpression)
        string = string.replacingOccurrences(of: #"(\S)'(\S)"#, with: #"$1’$2"#, options: .regularExpression)
        string = string.replacingOccurrences(of: #"'(\d\ds?)"#, with: #"’$1"#, options: .regularExpression)
        return string
    }
