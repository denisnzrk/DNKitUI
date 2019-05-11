//
//  UITableView+Reusable.swift
//  DNKitUI
//
//  Created by NAZARENKO Denis on 06/04/2019.
//

import Foundation

public extension UITableView {
    final func register<T: UITableViewCell>(type: T.Type)
        where T: Reusable & NibLoadable {
            self.register(type.nib, forCellReuseIdentifier: type.reuseIdentifier)
    }
    final func register<T: UITableViewCell>(type: T.Type)
        where T: Reusable {
            self.register(type.self, forCellReuseIdentifier: type.reuseIdentifier)
    }
    
    final func dequeue<T: UITableViewCell>(for indexPath: IndexPath, type: T.Type = T.self) -> T
        where T: Reusable {
            guard let cell = self.dequeueReusableCell(withIdentifier: type.reuseIdentifier, for: indexPath) as? T else {
                fatalError(
                    "Failed to dequeue a cell with identifier \(type.reuseIdentifier) matching type \(type.self). "
                        + "Check that the reuseIdentifier is set properly in your XIB/Storyboard "
                        + "and that you registered the cell beforehand"
                )
            }
            return cell
    }
    
    final func register<T: UITableViewHeaderFooterView>(headerFooterViewType: T.Type)
        where T: Reusable & NibLoadable {
            self.register(headerFooterViewType.nib, forHeaderFooterViewReuseIdentifier: headerFooterViewType.reuseIdentifier)
    }
    
    final func register<T: UITableViewHeaderFooterView>(headerFooterViewType: T.Type)
        where T: Reusable {
            self.register(headerFooterViewType.self, forHeaderFooterViewReuseIdentifier: headerFooterViewType.reuseIdentifier)
    }

    final func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(_ viewType: T.Type = T.self) -> T?
        where T: Reusable {
            guard let view = self.dequeueReusableHeaderFooterView(withIdentifier: viewType.reuseIdentifier) as? T? else {
                fatalError(
                    "Failed to dequeue a header/footer with identifier \(viewType.reuseIdentifier) "
                        + "matching type \(viewType.self). "
                        + "Check that the reuseIdentifier is set properly in your XIB/Storyboard "
                        + "and that you registered the header/footer beforehand"
                )
            }
            return view
    }
}
