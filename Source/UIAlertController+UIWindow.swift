import UIKit

/// A private strong reference to the window so it does not automatically get deallocated after is is presented
private var window: UIWindow?

public extension UIAlertController {
    /// Shows the alert controller in it's own UIWindow. This allows presentation of alerts from anywhere.
    ///
    /// - Parameters:
    ///   - animated: Whether or not to animate the presentation of the alert
    ///   - completion: Closure for when the presentation is complete
    func show(animated: Bool = true, completion: (() -> Void)? = nil) {
        if #available(iOS 13.0, *) {
            guard let windowScene = UIApplication.shared
                .connectedScenes
                .filter({ $0.activationState == .foregroundActive })
                .first as? UIWindowScene else {
                window = UIWindow(frame: UIScreen.main.bounds)
                return
            }

            window = UIWindow(windowScene: windowScene)
        } else {
            window = UIWindow(frame: UIScreen.main.bounds)
        }

        window?.rootViewController = UIViewController()
        window?.windowLevel = UIWindow.Level.alert + 1
        window?.makeKeyAndVisible()
        window?.rootViewController?.present(self, animated: animated, completion: completion)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        window = nil
    }
}
