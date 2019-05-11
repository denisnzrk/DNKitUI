//
//  UIView+Anchors.swift
//  DNKitUI
//
//  Created by NAZARENKO Denis on 31/03/2019.
//

import Foundation

public extension UIView {
    func pinToEdges(insets: UIEdgeInsets = .zero) {
        guard let superview = superview else { fatalError("🤦🏼‍♂️ There is no superview.") }
        
        translatesAutoresizingMaskIntoConstraints = false
        
        topAnchor.constraint(equalTo: superview.topAnchor, constant: insets.top).isActive = true
        bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: insets.bottom).isActive = true
        leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: insets.left).isActive = true
        trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: insets.right).isActive = true
    }
    
    func centerInSuperview() {
        guard let superview = superview else { fatalError("🤦🏼‍♂️ There is no superview.") }
        
        translatesAutoresizingMaskIntoConstraints = false
        
        centerXAnchor.constraint(equalTo: superview.centerXAnchor).isActive = true
        centerYAnchor.constraint(equalTo: superview.centerYAnchor).isActive = true
    }
}
