# NavigationLargeTitleSwiftUI

![Swift](https://img.shields.io/badge/Swift-5.1_5.2_5.3_5.4_5.5_5.6-Orange?style=flat-square)
![Platforms](https://img.shields.io/badge/Platforms-macOS_iOS_tvOS_watchOS-Green?style=flat-square)
![SPM](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange?style=flat-square)
[![Twitter](https://img.shields.io/badge/Twitter-@Vosough_k-blue.svg?style=flat-square)](https://twitter.com/vosough_k)
[![Linkedin](https://img.shields.io/badge/Linkedin-KiarashVosough-blue.svg?style=flat-square)](https://www.linkedin.com/in/kiarashvosough/)

A WorkAround through Large Title on NavigationBar and ScrollView in SwiftUI.

- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [Contributors](#contributors)
- [License](#license)

## Features

- [x] Observe `ScrollView` offset when user scrolls.
- [x] Manage Large Title on pages which depend ScrollView.
- [x] Provided Example

## Requirements

| Platform | Minimum Swift Version | Installation | Status |
| --- | --- | --- | --- |
| iOS 14.0+ | 5.5 | [SPM](#cocoapods) | Tested |
| macOS 11+ | 5.5 | [SPM](#cocoapods) | NotTested |

## Installation

### SPM

The [Swift Package Manager](https://www.swift.org/package-manager) is a tool for automating the distribution of Swift code and is integrated into the swift compiler.

Once you have your Swift package set up, adding `NavigationLargeTitleSwiftUI` as a dependency is as easy as adding it to the dependencies value of your Package.swift.

```swift
dependencies: [
    .package(url: "https://github.com/kiarashvosough1999/NavigationLargeTitleSwiftUI.git", .upToNextMajor(from: "0.0.1"))
]
```

## Usage

I have provided example on [root/NavigationLargeTitleSwiftUIExamples](https://github.com/kiarashvosough1999/NavigationLargeTitleSwiftUI/tree/master/NavigationLargeTitleSwiftUIExamples/NavigationLargeTitleSwiftUIExamples)

## Contributors

Feel free to share your ideas or any other problems. Pull requests are welcomed.

## License

`NavigationLargeTitleSwiftUI` is released under an MIT license. See [LICENSE](https://github.com/kiarashvosough1999/NavigationLargeTitleSwiftUI/blob/master/LICENSE) for more information.
