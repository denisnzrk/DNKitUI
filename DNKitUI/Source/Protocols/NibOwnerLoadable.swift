//
//  NibOwnerLoadable.swift
//  ndkitUI
//
//  Created by NAZARENKO Denis on 31/03/2019.
//

import Foundation

/// Make your UIView subclasses conform to this protocol when:
///  * they *are* NIB-based, and
///  * this class is used as the XIB's File's Owner
///
public protocol NibOwnerLoadable: class {
    static var nib: UINib { get }
}

public extension NibOwnerLoadable {
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: Bundle(for: self))
    }
}

public extension NibOwnerLoadable where Self: UIView {
    func loadNibContent() {
        let layoutAttributes: [NSLayoutConstraint.Attribute] = [.top, .leading, .bottom, .trailing]
        for case let view as UIView in Self.nib.instantiate(withOwner: self, options: nil) {
            view.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(view)
            NSLayoutConstraint.activate(layoutAttributes.map { attribute in
                NSLayoutConstraint(
                    item: view, attribute: attribute,
                    relatedBy: .equal,
                    toItem: self, attribute: attribute,
                    multiplier: 1, constant: 0.0
                )
            })
        }
    }
}
