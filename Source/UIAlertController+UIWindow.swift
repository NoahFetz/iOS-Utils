import UIKit

public extension UIAlertController {
    /// Shows the alert controller in it's own UIWindow. This allows presentation of alerts from anywhere.
    ///
    /// - Parameters:
    ///   - animated: Whether or not to animate the presentation of the alert
    ///   - completion: Closure for when the presentation is complete
    func show(animated: Bool = true, completion: (() -> Void)? = nil) {
        let alertWindow = UIWindow(frame: UIScreen.main.bounds)
        alertWindow.rootViewController = UIViewController()
        alertWindow.windowLevel = UIWindow.Level.alert + 1
        alertWindow.makeKeyAndVisible()
        alertWindow.rootViewController?.present(self, animated: animated, completion: completion)
    }
}
