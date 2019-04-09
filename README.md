# iOS-Utils

[![Version](https://img.shields.io/cocoapods/v/iOS-Utils.svg?style=flat)](#installation)
[![Swift 5](https://img.shields.io/badge/Swift-5.0-orange.svg)](#)
[![Platforms](https://img.shields.io/cocoapods/p/iOS-Utils.svg?style=flat)](#)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License](https://img.shields.io/cocoapods/l/iOS-Utils.svg?style=flat)](http://doge.mit-license.org)

The purpose of iOS-Utils is to bring together a bunch of useful utility classes, extensions, and protocols to make iOS development a little easier.

- [Requirements](#requirements)
- [Installation](#installation)
- [CocoaPods](#cocoapods)
- [Carthage](#carthage)
- [Utilities](#utilities)
- [DesignableView & DesignableButton](#designableview-&-designablebutton)
- [UIAlertController+Convenience](#uialertcontroller+convenience)
- [ClassName](#classname)

## Requirements

- iOS 11.0+
- Xcode 10.2+
- Swift 5.0+

## Installation

### CocoaPods

[CocoaPods](https://cocoapods.org/) is a dependency manager for Swift and Objective-C Cocoa projects.

To integrate iOS-Utils into your Xcode project using CocoaPods, add the following to your Podfile:

```ruby
pod 'iOS-Utils', '~> 1.1'
```

## Utilities

### DesignableView & DesignableButton

DesignableView (UIControl) and DesignableButton (UIButton) are IBDesignable views that allow manipulation of properties such as corner radius or drop shadow in Interface Builder, and displays those changes as they are made.

IBInspectable properties:

- cornerRadius
- roundTopLeft
- roundTopRight
- roundBottomLeft
- roundBottomRight
- borderColor
- borderWidth
- shadowColor
- shadowOffset
- shadowOpacity
- shadowRadius
- gradientStartColor
- gradientStartPoint
- gradientEndColor
- gradientEndPoint

### UIAlertController+Convenience

UIAlertController+Convenience is a lightweight extension for UIAlertController that allows for easier creation of UIAlertControllers while also making it a bit easier to read.

#### Standard UIAlertController creation:

```swift
let alert = UIAlertController(title: "title", message: "message", preferredStyle: .alert)

let okAction = UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default, handler: { _ in
// OK pressed
})

let cancelAction = UIAlertController(title: NSLocalizedString("Cancel", comment: ""), style: .cancel, handler: { _ in
// Cancel pressed
})

alert.addAction(okAction)
alert.addAction(cancelAction)
```

#### Convenience UIAlertController creation:

```swift
let newAlert = UIAlertController(title: "title",
                                 message: "message",
                                 alertActions: [
                                     .ok({ _ in
                                         // Ok pressed
                                     }),
                                     .cancel({ _ in
                                         // Cancel pressed
                                     }),
])
```

or

```swift
let okAction = AlertAction.ok({ _ in
// Ok pressed
})

let cancelAction = AlertAction.cancel({ _ in
// Cancel pressed
})

let alert = UIAlertController(title: "title", message: "message", alertActions: [okAction, cancelAction])
```

### ClassName

ClassName is a simple extension on NSObject that adds a className property to any NSObject as a static variable and instance variable.

```swift
let className = YourClass.className // "YourClass"
```

```swift
let classInstance = YourClass()
let className = classInstance.className // "YourClass"
```
