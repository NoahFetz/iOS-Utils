import Foundation

public extension NSObject {
    /// Returns the name of the class as a String
    class var className: String {
        return String(describing: self)
    }

    /// Returns the name of the class instance as a String
    var className: String {
        return String(describing: type(of: self))
    }
}
