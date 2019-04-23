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
    - [DesignableView & DesignableButton](#designableview--designablebutton)
    - [UIAlertController+Convenience](#uialertcontrollerconvenience)
    - [UIAlertcontroller+UIWindow](#uialertcontrolleruiwindow)
    - [KeyboardNotificationInfo](#keyboardnotificationinfo)
    - [KeyboardObservable](#keyboardobservable)
    - [KeyboardRespondable](#keyboardrespondable)
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
pod 'iOS-Utils', '~> 1.3'
```

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a dependency manager for Cocoa applications that provides binary frameworks while allowing full control over project structure and setup.

To integrate iOS-Utils into your Xcode project using Carthage, create a Cartfile and add the following:

```ruby
github "ark-develop/iOS-Utils" ~> 1.3
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

UIAlertController+Convenience is an extension for UIAlertController that allows for easier creation of UIAlertControllers while also making it a bit easier to read.

#### Standard UIAlertController creation:

```swift
let alert = UIAlertController(title: "title", message: "message", preferredStyle: .alert)

let okAction = UIAlertAction(title: "Okay", style: .default, handler: { _ in
// Okay pressed
})

let cancelAction = UIAlertController(title: "Cancel", style: .cancel, handler: { _ in
// Cancel pressed
})

alert.addAction(okAction)
alert.addAction(cancelAction)
```

#### Convenience UIAlertController creation:

```swift
let alert = UIAlertController(title: "title",
                              message: "message",
                              preferredStyle: .alert,
                              alertActions: [
                                  .okay({ _ in
                                      // Okay Pressed
                                  }),
                                  .cancel({ _ in
                                      // Cancel Pressed
                                  }),
                              ])
```

or

```swift
let okAction: AlertAction = .okay({ _ in
    // Okay pressed
})

let cancelAction: AlertAction = .cancel({ _ in
    // Cancel pressed
})

let alert = UIAlertController(title: "title", message: "message", preferredStyle: .alert, alertActions: [okAction, cancelAction])
```

### UIAlertController+UIWindow

UIAlertController+UIWindow is an extension for UIAlertController that allows for the presentation of UIAlertControllers similar to how UIAlertView used to work. With this implementation, it is possible to present an alert from anywhere as a UIViewController (or subclass of) is not required. A separate UIWindow is created on invocation, and the alert is presented in that window. When the alert is dismissed, the application's window is set back to the key window.

UIAlertController+UIWindow works with UIAlertController's with a preferred style of .alert and .actionSheet.

```swift
// Convenience initializer from UIAlertController+Convenience.swift
let alert = UIAlertController(title: "title",
                              message: "message",
                              preferredStyle: .alert,
                              alertActions: [
                                  .okay({ _ in
                                      // Okay Pressed
                                  }),
                                  .cancel({ _ in
                                      // Cancel Pressed
                                  }),
                              ])
])

alert.show() // Shows the alert
```

### KeyboardNotificationInfo

KeyboardNotificationInfo is a data model for the Notification Object that is sent when responding to keyboard events.

Notification Properties:

- animationDuration (TimeInterval)
- animationOptions (UIView.AnimationOptions?)
- beginFrame (CGRect)
- endFrame (CGRect)
- isLocalUser (Bool)

### KeyboardObservable

KeyboardObservable is a protocol that adds functions to register/un-register from keyboard notifications. Additionally, it exposes the functions that are called when those events fire.

```swift
class FooViewController: UIViewController, KeyboardObservable {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        registerForKeyboardEvents()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unregisterForKeyboardEvents()
    }

    func keyboardWillShow(_ notification: Notification) {
        // notification is the Notification object containing the keyboard information
    }

    func keyboardWillHide(_ notification: Notification) {
        // notification is the Notification object containing the keyboard information
    }
}
```

### KeyboardRespondable

KeyboardRespondable extends KeyboardObservable slightly, by adding automatic handling of a view's content inset.

The protocol requires a `contentView` that conforms to `ContentInsetAdjustable` whose only requirement is the conformer must have a mutable `contentInset` property.

KeyboardRespondable will automatically adjust the content insets of the `contentView` when the keyboard shows and hides based on the amount of overlap of the keyboard and the `contentView`.

_**NOTE:** If the `keyboardWillShow(_:)` and/or `keyboardWillHide(_:)` functions are added in in the view controller implementation, the scroll view will not automatically adjust its insets correctly._

### ClassName

ClassName is a simple extension on NSObject that adds a className property to any NSObject as a static variable and instance variable.

```swift
let className = YourClass.className // "YourClass"
```

```swift
let classInstance = YourClass()
let className = classInstance.className // "YourClass"
```
