import UIKit

@available(tvOS, unavailable)
public protocol KeyboardObservable: NSObjectProtocol {
    /// Function to register for keyboard events. Should be called in viewWillAppear.
    func registerForKeyboardEvents()

    /// Function to unregister from keyboard events. Should be called in viewWillDisappear.
    func unregisterForKeyboardEvents()

    /// Called when the keyboard will show.
    ///
    /// - Parameter notification: The notification object containing the keyboard information.
    func keyboardWillShow(_ notification: Notification)

    /// Called when the keyboard will hide.
    ///
    /// - Parameter notification: The notification object containing the keyboard information.
    func keyboardWillHide(_ notification: Notification)
}

@available(tvOS, unavailable)
public extension KeyboardObservable {
    func registerForKeyboardEvents() {
        _ = NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification,
                                                   object: nil,
                                                   queue: .main,
                                                   using: { [weak self] notification in
                                                       self?.keyboardWillShow(notification)
        })

        _ = NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification,
                                                   object: nil,
                                                   queue: .main,
                                                   using: { [weak self] notification in
                                                       self?.keyboardWillHide(notification)
        })
    }

    func unregisterForKeyboardEvents() {
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillShowNotification,
                                                  object: nil)

        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillHideNotification,
                                                  object: nil)
    }
}
