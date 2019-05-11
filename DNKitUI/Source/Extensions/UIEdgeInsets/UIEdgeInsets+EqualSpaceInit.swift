//
//  UIEdgeInsets+EqualSpaceInit.swift
//  DNKitUI
//
//  Created by NAZARENKO Denis on 11/05/2019.
//

import Foundation

public extension UIEdgeInsets {
    init(space: CGFloat) {
        self = UIEdgeInsets(top: space, left: space, bottom: -space, right: -space)
    }
}
