import UIKit

public typealias AlertActionHandler = (UIAlertAction) -> Void

/// An enum defining a few standard actions and a case for defining custom actions.
/// All actions can be provided an optional handler for when that button is pressed on the controller.
///
/// - okay: Default UIAlertAction with a title of "Okay" and a style of .default
/// - cancel: Default UIAlertAction with a title of "Cancel" and a style of .cancel
/// - delete: Default UIAlertAction with a title of "Delete" and a style of .destructive
/// - done: Default UIAlertAction with a title of "Done" and a style of .default
/// - custom: Custom Alert Action that uses the provided title and style

public enum AlertAction {
    case okay(AlertActionHandler? = nil)
    case cancel(AlertActionHandler? = nil)
    case delete(AlertActionHandler? = nil)
    case done(AlertActionHandler? = nil)
    case custom(String?, UIAlertAction.Style, AlertActionHandler?)
}

private extension AlertAction {
    var alertAction: UIAlertAction {
        switch self {
        case let .okay(handler):
            return UIAlertAction(title: NSLocalizedString("Okay", comment: ""), style: .default, handler: handler)

        case let .cancel(handler):
            return UIAlertAction(title: NSLocalizedString("Cancel", comment: ""), style: .cancel, handler: handler)

        case let .delete(handler):
            return UIAlertAction(title: NSLocalizedString("Delete", comment: ""), style: .destructive, handler: handler)

        case let .done(handler):
            return UIAlertAction(title: NSLocalizedString("Done", comment: ""), style: .default, handler: handler)

        case let .custom(title, style, handler):
            return UIAlertAction(title: title, style: style, handler: handler)
        }
    }
}

public extension UIAlertController {
    /// Convenience initializer for an UIAlertController that takes in an Error,
    /// as well as an array of AlertActions.
    ///
    /// Note: Alert actions will be added based on their ordering within the array.
    ///
    /// - Parameters:
    ///   - error: A value conforming to the Swift.Error protocol
    ///   - alertActions: An array of AlertActions to add as actions for the controller

    convenience init(error: Error,
                     alertActions: [AlertAction]? = nil) {
        self.init(title: NSLocalizedString("Error", comment: ""),
                  message: error.localizedDescription,
                  preferredStyle: .alert,
                  alertActions: alertActions)
    }

    /// Convenience initializer for an UIAlertController that takes in some default
    /// properties, as well as an array of AlertActions.
    ///
    /// Note: Alert actions will be added based on their ordering within the array.
    ///
    /// - Parameters:
    ///   - title: Optional string for the title of the controller
    ///   - message: Optional string for the message of the controller
    ///   - alertActions: Optional array of AlertActions to add as actions for the controller

    convenience init(title: String? = nil,
                     message: String? = nil,
                     alertActions: [AlertAction]? = nil) {
        self.init(title: title,
                  message: message,
                  preferredStyle: .alert,
                  alertActions: alertActions)
    }

    /// Convenience initializer for an UIAlertController that takes in the default
    /// properties, as well as an array of AlertActions.
    ///
    /// Note: Alert actions will be added based on their ordering within the array.
    ///
    /// - Parameters:
    ///   - title: Optional string for the title of the controller
    ///   - message: Optional string for the message of the controller
    ///   - preferredStyle: The style of the controller (.alert || .actionSheet)
    ///   - alertActions: An array of AlertActions to add as actions for the controller

    convenience init(title: String? = nil,
                     message: String? = nil,
                     preferredStyle: UIAlertController.Style = .alert,
                     alertActions: [AlertAction]?) {
        self.init(title: title, message: message, preferredStyle: preferredStyle)

        guard let alertActions = alertActions,
            alertActions.count > 0 else {
            addAction(AlertAction.okay(nil).alertAction)
            return
        }

        alertActions.forEach({ addAction($0.alertAction) })
    }
}
