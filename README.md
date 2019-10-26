# SmartQuotes

A simple Swift `String` extension for converting straight apostrophes and quotes in to typographically correct curly versions.

This package provides a `.withSmartQuotes` property on `String`, which defaults to English conversions.

For other localizations, a locale can be provided to `.withSmartQuotes(locale: Locale?)`. Currently only `de`, `fi`, and `sv` are implemented. I’m open to contributions for other localizations!

## Usage

```swift
import SmartQuotes

"\"Crime peaked in the '90s\"".withSmartQuotes   // “Crime peaked in the ’90s”

"\"Crime peaked in the '90s\"".withSmartQuotes(  // „Crime peaked in the ‘90s“
    Locale(identifier: "de")
)
```

## Installation

#### Carthage

```ruby
# Cartfile
github "hallee/swift-smart-quotes" ~> 0.0.1
```

#### CocoaPods

```ruby
# Podfile
pod 'SmartQuotes'
```

#### SwiftPM

```swift
dependencies: [
    .package(url: "https://github.com/hallee/swift-smart-quotes", from: "0.0.1")
],
targets: [
    .target(name: "YourTarget", dependencies: ["SmartQuotes"])
]
```

## TODO

- [ ] Localizations
