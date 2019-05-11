//
//  NibLoadable.swift
//  ndkitUI
//
//  Created by NAZARENKO Denis on 31/03/2019.
//

import Foundation

/// Make your UIView subclasses conform to this protocol when:
///  * they *are* NIB-based, and
///  * this class is used as the XIB's root view
///
/// to be able to instantiate them from the NIB in a type-safe manner

// MARK: NibLoadable
public protocol NibLoadable: class {
    static var nib: UINib { get }
}

public extension NibLoadable {
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: Bundle(for: self))
    }
}

public extension NibLoadable where Self: UIView {
    static func loadFromNib() -> Self {
        guard let view = nib.instantiate(withOwner: nil, options: nil).first as? Self else {
            fatalError("The nib \(nib) expected its root view to be of type \(self) 🤦🏼‍♂️")
        }
        
        return view
    }
}

public typealias NibReusable = Reusable & NibLoadable
