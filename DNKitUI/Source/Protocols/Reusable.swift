//
//  Reusable.swift
//  ndkitUI
//
//  Created by NAZARENKO Denis on 31/03/2019.
//

import Foundation

// MARK: Reusable
public protocol Reusable: class {
    static var reuseIdentifier: String { get }
}

public extension Reusable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
