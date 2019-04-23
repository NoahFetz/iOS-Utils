import UIKit

/// Data model for the Notification object sent when responding to keyboard events.
public struct KeyboardNotificationInfo {
    let animationDuration: TimeInterval
    let animationOptions: UIView.AnimationOptions?
    let beginFrame: CGRect
    let endFrame: CGRect
    let isLocalUser: Bool

    /// Creates an instance of KeyboardNotificationInfo from a Notification if able.
    ///
    /// - Parameter notification: The Notification object sent when responding to keyboard events.
    public init?(notification: Notification) {
        guard let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval,
            let beginFrame = notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? CGRect,
            let endFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect,
            let isLocalUser = notification.userInfo?[UIResponder.keyboardIsLocalUserInfoKey] as? Bool else {
            return nil
        }

        let animationOptions = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? UIView.AnimationOptions

        self.init(animationDuration: animationDuration, animationOptions: animationOptions, beginFrame: beginFrame, endFrame: endFrame, isLocalUser: isLocalUser)
    }

    private init(animationDuration: TimeInterval, animationOptions: UIView.AnimationOptions?, beginFrame: CGRect, endFrame: CGRect, isLocalUser: Bool) {
        self.animationDuration = animationDuration
        self.animationOptions = animationOptions
        self.beginFrame = beginFrame
        self.endFrame = endFrame
        self.isLocalUser = isLocalUser
    }
}
