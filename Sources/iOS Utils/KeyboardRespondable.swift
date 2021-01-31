#if canImport(UIKit)

import UIKit

@available(tvOS, unavailable)
public protocol ContentInsetAdjustable where Self: UIView {
    var contentInset: UIEdgeInsets { get set }
}

@available(tvOS, unavailable)
extension UIScrollView: ContentInsetAdjustable {}

@available(tvOS, unavailable)
public protocol KeyboardRespondable: KeyboardObservable {
    /// The views that should respond to keyboard frame changes
    var respondableViews: [ContentInsetAdjustable] { get }
}

@available(tvOS, unavailable)
public extension KeyboardRespondable {
    func keyboardWillShow(_ notification: Notification) {
        guard let notificationInfo = KeyboardNotificationInfo(notification: notification) else {
            return
        }

        updateScrollViewFrame(for: notificationInfo.endFrame)
    }

    func keyboardWillHide(_ notification: Notification) {
        guard let notificationInfo = KeyboardNotificationInfo(notification: notification) else {
            return
        }

        updateScrollViewFrame(for: notificationInfo.endFrame)
    }

    private func updateScrollViewFrame(for keyboardFrame: CGRect) {
        respondableViews.forEach { view in
            let convertedViewFrame = view.superview?.convert(
                view.frame,
                to: UIApplication.shared.currentWindow
            ) ?? .zero

            let viewMaxY = convertedViewFrame.maxY
            let keyboardMinY = keyboardFrame.minY

            let diff = max(0.0, viewMaxY - keyboardMinY)

            view.contentInset = UIEdgeInsets(top: view.contentInset.top,
                                             left: view.contentInset.left,
                                             bottom: diff,
                                             right: view.contentInset.right)
        }
    }
}

#endif
