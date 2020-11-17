import UIKit

extension UIApplication {
    var currentWindow: UIWindow? {
        if #available(iOS 13.0, *) {
            return windows
                .filter { $0.isKeyWindow }
                .first
        } else {
            return keyWindow
        }
    }
}
