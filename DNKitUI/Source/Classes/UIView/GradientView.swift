//
//  GradientView.swift
//  DNKitUI
//
//  Created by NAZARENKO Denis on 03/05/2019.
//

import UIKit
import DNKitUtils

public enum GradientPoint {
    case topLeft
    case centerLeft
    case bottomLeft
    case topCenter
    case center
    case bottomCenter
    case topRight
    case centerRight
    case bottomRight
    case custom(x: CGFloat, y: CGFloat)
    
    public var cgPoint: CGPoint {
        switch self {
        case .topLeft:
            return CGPoint(x: 0, y: 0)
        case .centerLeft:
            return CGPoint(x: 0, y: 0.5)
        case .bottomLeft:
            return CGPoint(x: 0, y: 1.0)
        case .topCenter:
            return CGPoint(x: 0.5, y: 0)
        case .center:
            return CGPoint(x: 0.5, y: 0.5)
        case .bottomCenter:
            return CGPoint(x: 0.5, y: 1.0)
        case .topRight:
            return CGPoint(x: 1.0, y: 0.0)
        case .centerRight:
            return CGPoint(x: 1.0, y: 0.5)
        case .bottomRight:
            return CGPoint(x: 1.0, y: 1.0)
        case let .custom(x, y):
            return CGPoint(x: x, y: y)
        }
    }
}

public struct GradientDirection {
    public let start: GradientPoint
    public let end: GradientPoint

    public init(start: GradientPoint, end: GradientPoint) {
        self.start = start
        self.end = end
    }
}

public class GradientView: UIView {
  
    public var direction: GradientDirection = .init(start: .centerLeft, end: .centerRight) {
        didSet {
            updateGradient()
        }
    }
    
    public var colors: [UIColor] = [.white, .lightGray] {
        didSet {
            updateGradient()
        }
    }
    
    public var distribution: [CGFloat] = [0.5] {
        didSet {
            updateGradient()
        }
    }
    
    override public class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        updateGradient()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        updateGradient()
    }
    
    func updateGradient() {
        if let layer = layer as? CAGradientLayer {
            layer.startPoint = direction.start.cgPoint
            layer.endPoint = direction.end.cgPoint
            
            layer.locations = distribution.map { $0 as NSNumber }
            
            layer.colors = colors.map { $0.cgColor }
        }
    }
}

