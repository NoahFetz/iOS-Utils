#if canImport(UIKit)

import UIKit

@available(iOS 11.0, *)
@IBDesignable
open class DesignableView: UIControl {
    // MARK: - Corners

    @IBInspectable
    open var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }

    @IBInspectable
    open var roundTopLeft: Bool = true {
        didSet {
            if roundTopLeft {
                layer.maskedCorners = layer.maskedCorners.union(.layerMinXMinYCorner)
            } else {
                layer.maskedCorners.subtract(.layerMinXMinYCorner)
            }
        }
    }

    @IBInspectable
    open var roundTopRight: Bool = true {
        didSet {
            if roundTopRight {
                layer.maskedCorners = layer.maskedCorners.union(.layerMaxXMinYCorner)
            } else {
                layer.maskedCorners.subtract(.layerMaxXMinYCorner)
            }
        }
    }

    @IBInspectable
    open var roundBottomLeft: Bool = true {
        didSet {
            if roundBottomLeft {
                layer.maskedCorners = layer.maskedCorners.union(.layerMinXMaxYCorner)
            } else {
                layer.maskedCorners.subtract(.layerMinXMaxYCorner)
            }
        }
    }

    @IBInspectable
    open var roundBottomRight: Bool = true {
        didSet {
            if roundBottomRight {
                layer.maskedCorners = layer.maskedCorners.union(.layerMaxXMaxYCorner)
            } else {
                layer.maskedCorners.subtract(.layerMaxXMaxYCorner)
            }
        }
    }

    // MARK: - Border

    @IBInspectable
    open var borderColor: UIColor = .clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }

    @IBInspectable
    open var borderWidth: CGFloat = 0.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }

    // MARK: - Shadow

    @IBInspectable
    open var shadowColor: UIColor = .clear {
        didSet {
            layer.shadowColor = shadowColor.cgColor
        }
    }

    @IBInspectable
    open var shadowOffset: CGSize = .zero {
        didSet {
            layer.shadowOffset = shadowOffset
        }
    }

    @IBInspectable
    open var shadowOpacity: Float = 0.0 {
        didSet {
            layer.shadowOpacity = shadowOpacity
        }
    }

    @IBInspectable
    open var shadowRadius: CGFloat = 0.0 {
        didSet {
            layer.shadowRadius = shadowRadius
        }
    }

    // MARK: - Gradient

    @IBInspectable
    open var gradientStartColor: UIColor = .clear {
        didSet {
            guard let layer = layer as? CAGradientLayer else {
                return
            }

            layer.colors = [gradientStartColor.cgColor, gradientEndColor.cgColor]
        }
    }

    @IBInspectable
    open var gradientStartPoint = CGPoint(x: 0.5, y: 0.0) {
        didSet {
            guard let layer = layer as? CAGradientLayer else {
                return
            }

            layer.startPoint = gradientStartPoint
        }
    }

    @IBInspectable
    open var gradientEndColor: UIColor = .clear {
        didSet {
            guard let layer = layer as? CAGradientLayer else {
                return
            }

            layer.colors = [gradientStartColor.cgColor, gradientEndColor.cgColor]
        }
    }

    @IBInspectable
    open var gradientEndPoint = CGPoint(x: 0.5, y: 1.0) {
        didSet {
            guard let layer = layer as? CAGradientLayer else {
                return
            }

            layer.endPoint = gradientEndPoint
        }
    }

    // MARK: - Highlighting

    @IBInspectable
    open var highlightAlpha: CGFloat = 1.0

    open var highlightViews: [UIView] {
        []
    }

    override open var isHighlighted: Bool {
        didSet {
            if !highlightViews.isEmpty {
                highlightViews.forEach { $0.alpha = isHighlighted ? highlightAlpha : 1.0 }
            } else {
                self.alpha = isHighlighted ? highlightAlpha : 1.0
            }
        }
    }

    // MARK: - View

    override open class var layerClass: AnyClass {
        return CAGradientLayer.self
    }

    override public func layoutSubviews() {
        super.layoutSubviews()

        layer.shouldRasterize = shadowColor != .clear && shadowOpacity != 0.0
    }
}

#endif
