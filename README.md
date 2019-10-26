# SmartQuotes

A simple Swift `String` extension for converting straight apostrophes and quotes in to typographically correct curly versions.

## Usage

```swift
import SmartQuotes

print("\"Crime peaked in the '90s\"".withSmartQuotes) // “Crime peaked in the ’90s”
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

### TODO

- [ ] Localizations
