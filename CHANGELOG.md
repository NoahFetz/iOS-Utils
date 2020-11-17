# Changelog

## 1.6.0 (Swift Package Manager)

### Updated

- Restructured the source to add support for Swift Package Manager

### Added

- [UIApplication+UIWindow.swift](./Sources/iOS&#32;Utils/UIApplication+UIWindow.swift)
    - Computed variable for getting the current window since `keyWindow` was deprecated in iOS 13.0
- [README.md](./README.md)
- [CHANGELOG.md](./CHANGELOG.md)

## 1.5.1 (Designable View Highlighting)

### Updated

- [DesignableButton](./Sources/iOS&#32;Utils/DesignableButton.swift)
    - Code formatting
- [DesignableView](./Sources/iOS&#32;Utils/DesignableView.swift)
    - Code formatting
    - Added the ability to set the highlight alpha and specify what views, if any, should be highlighted.
- [README.md](./README.md)
- [CHANGELOG.md](./CHANGELOG.md)

## 1.5.0 (iOS 13 and Updates)

### Updated

- Recompiled the library for Xcode 11 and iOS 13
- [KeyboardObservable](./Sources/iOS&#32;Utils/KeyboardObservable.swift)
  - Code formatting
- [KeyboardRespondable](./Sources/iOS&#32;Utils/KeyboardRespondable.swift)
  - Added the ability to define multiple `ContentInsetAdjustable` views to respond to the keyboard.
- [UIAlertController+Convenience.swift](./Sources/iOS&#32;Utils/UIAlertController+Convenience.swift)
  - Added an additional convenience initializer
  - Updated the nullability of some convenience initializer parameters
- [README.md](./README.md)
- [CHANGELOG.md](./CHANGELOG.md)

## 1.4.0 (Sub Specs)

### Added

- The ability to specify specific sub specs to incorporate.

### Updated

- [KeyboardNotificationInfo](./Sources/iOS&#32;Utils/KeyboardNotificationInfo.swift)
  - Code formatting
- [KeyboardObservable](./Sources/iOS&#32;Utils/KeyboardObservable.swift)
  - Code formatting
- [KeyboardRespondable](./Sources/iOS&#32;Utils/KeyboardRespondable.swift)
  - Code formatting
- [README.md](./README.md)
- [CHANGELOG.md](./CHANGELOG.md)

## 1.3.0 (Keyboard Utils)

### Added

- [KeyboardNotificationInfo](./Sources/iOS&#32;Utils/KeyboardNotificationInfo.swift)
- [KeyboardObservable](./Sources/iOS&#32;Utils/KeyboardObservable.swift)
- [KeyboardRespondable](./Sources/iOS&#32;Utils/KeyboardRespondable.swift)

### Updated

- [README.md](./README.md)
- [CHANGELOG.md](./CHANGELOG.md)

## 1.2.1 (GitHub Migration)

### Updated

- Migrated source code from `GitLab` to `GitHub`
- [CHANGELOG.md](./CHANGELOG.md)

## 1.2.0 (UIAlertController+UIWindow)

### Added

- [UIAlertController+UIWindow.swift](./Sources/iOS&#32;Utils/UIAlertController+UIWindow.swift)

### Updated

- [UIAlertController+Convenience.swift](./Sources/iOS&#32;Utils/UIAlertController+Convenience.swift)
  - Changed the `.ok` case to `.okay` to comply with SwiftLint rule `identifier_name`
- [README.md](./README.md)
- [CHANGELOG.md](./CHANGELOG.md)

## 1.1.1 (CHANGELOG.md)

### Added

- [CHANGELOG.md](./CHANGELOG.md)

## 1.1.0 (DesignableButton & UIAlertController+Convenience)

### Added

- [DesignableButton.swift](./Sources/iOS&#32;Utils/DesignableButton.swift)
- [UIAlertController+Convenience.swift](./Sources/iOS&#32;Utils/UIAlertController+Convenience.swift)

### Updated

- [README.md](./README.md)

## 1.0.0 (iOS-Utils)

### Added

- [DesignableView.swift](./Sources/iOS&#32;Utils/DesignableView.swift)
- [NSObject+ClassName.swift](./Sources/iOS&#32;Utils/NSObject+ClassName.swift)
