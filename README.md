# BIP39UserFlow

[![Platform](https://img.shields.io/badge/Platforms-%20iOS-blue)](#platforms)
[![Swift Package Manager compatible](https://img.shields.io/badge/SPM-compatible-orange)](#swift-package-manager)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](https://github.com/anquii/BIP39UserFlow/blob/main/LICENSE)

An implementation of a customizable [BIP39](https://github.com/anquii/BIP39) user flow in Swift.

![BIP39UserFlow](./BIP39UserFlow.png)

## Platforms
- iOS 16.1+

## Installation

### Swift Package Manager

Add the following line to your `Package.swift` file:
```swift
.package(url: "https://github.com/anquii/BIP39UserFlow.git", from: "1.0.0")
```
...or integrate with Xcode via `File -> Swift Packages -> Add Package Dependency...` using the URL of the repository.

## Usage

```swift
import BIP39UserFlow

// Subscribe to published values, e.g. in your view model.
BIP39UserFlowPublishers.walletPublisher.sink { [unowned self] wallet in
    isPresented = false
}
BIP39UserFlowPublishers.dismissPublisher.sink { [unowned self] in
    isPresented = false
}

// Use the `sheet` modifier to present the flow.
.sheet(isPresented: $isPresented) {
    let configuration = BIP39UserFlowConfiguration()
    BIP39UserFlowViewConstructor(configuration: configuration).view()
}
```

Find out more by looking through the [demo](Demo) project, and by exploring the public [API](Sources/BIP39UserFlow/API), e.g. on how to apply your own color themes and copy, or how to configure the user experience.

## License

`BIP39UserFlow` is licensed under the terms of the MIT license. See the [LICENSE](LICENSE) file for more information.

## Donations

If you've found this software useful, please consider making a small contribution to one of these crypto addresses:

```
XNAV: xNTYqoQDzsiB5Cff9Wpt65AgZxYkt1GFy7KwuDafqRU2bcAZqoZUW4Q9TZ9QRHSy8cPsM5ALkJasizJCmqSNP9CosxrF2RbKHuDz5uJVUBcKJfvnb3RZaWygr8Bhuqbpc3DsgfB3ayc
XMR: 49jzT7Amu9BCvc5q3PGiUzWXEBQTLQw68a2KvBFTMs7SHjeWgrSKgxs69ycFWQupyw9fpR6tdT8Hp5h3KksrBG9m4c8aXiG
BTC: bc1q7hehfmnq67x5k7vz0cnc75qyflkqtxe2avjkyw
ETH (ERC-20) & BNB (BEP-20): 0xe08e383B4042749dE5Df57d48c57A690DC322b8d
```
