import UIKit

public protocol ContentInsetAdjustable where Self: UIView {
    var contentInset: UIEdgeInsets { get set }
}

extension UIScrollView: ContentInsetAdjustable {}

public protocol KeyboardRespondable: KeyboardObservable {
    associatedtype ContentViewType: ContentInsetAdjustable

    /// The scroll view that should respond to keyboard frame changes
    var contentView: ContentViewType? { get set }
}

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
        guard let contentView = self.contentView else {
            return
        }

        let convertedContentViewFrame =
            contentView.superview?.convert(contentView.frame, to: UIApplication.shared.keyWindow) ?? .zero
        let contentViewMaxY = convertedContentViewFrame.maxY
        let keyboardMinY = keyboardFrame.minY
        let diff = max(0.0, contentViewMaxY - keyboardMinY)

        contentView.contentInset = UIEdgeInsets(top: contentView.contentInset.top,
                                                left: contentView.contentInset.left,
                                                bottom: diff,
                                                right: contentView.contentInset.right)
    }
}
