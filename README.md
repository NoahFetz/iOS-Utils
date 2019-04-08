# iOS-Utils

[![Version](https://img.shields.io/cocoapods/v/iOS-Utils.svg?style=flat)](#installation) ![Swift 5](https://img.shields.io/badge/Swift-5.0-orange.svg)
![Platforms](https://img.shields.io/cocoapods/p/iOS-Utils.svg?style=flat)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License](https://img.shields.io/cocoapods/l/iOS-Utils.svg?style=flat)](http://doge.mit-license.org)

iOS-Utils is a set of convenient iOS utilities.

- [Requirements](#requirements)
- [Installation](#installation)
  - [CocoaPods](#cocoapods)
  - [Carthage](#carthage)
- [Utilities](#utilities)
  - [DesignableView](#designableview)
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
pod 'iOS-Utils', '~> 1.0'
```

## Utilities

### DesignableView

DesignableView is an IBDesignable view that allows manipulation of properties such as corner radius or drop shadow in Interface Builder, and displays those changes as they are made.

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

### ClassName

ClassName is a simple extension on NSObject that adds a className property to any NSObject as a static variable and instance variable.

```swift
let className = YourClass.classname // "YourClass"
```

```swift
let classInstance = YourClass()
let className = classInstance.className // "YourClass"
```
