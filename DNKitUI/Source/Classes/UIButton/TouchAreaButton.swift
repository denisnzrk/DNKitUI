//
//  TouchAreaButton.swift
//  ndkitUI
//
//  Created by NAZARENKO Denis on 31/03/2019.
//

import Foundation

public class TouchAreaButton: UIButton {
    
    public var padding: CGFloat = 10
    
    override public func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        return bounds.insetBy(dx: -padding, dy: -padding).contains(point)
    }
}
