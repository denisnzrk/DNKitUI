//
//  UICollectionView+Reusable.swift
//  ndkitUI
//
//  Created by NAZARENKO Denis on 31/03/2019.
//

import Foundation

public extension UICollectionView {
    func register<Cell: UICollectionViewCell>(type: Cell.Type) where Cell: NibReusable {
        register(type.nib, forCellWithReuseIdentifier: type.reuseIdentifier)
    }
    
    func register<Cell: UICollectionViewCell>(type: Cell.Type) where Cell: Reusable {
        register(type.self, forCellWithReuseIdentifier: type.reuseIdentifier)
    }
    
    func dequeue<Cell: UICollectionViewCell>(for indexPath: IndexPath,
                                             type: Cell.Type = Cell.self) -> Cell where Cell: Reusable {
        guard let cell = dequeueReusableCell(withReuseIdentifier: type.reuseIdentifier, for: indexPath) as? Cell
            else {
                fatalError("Failed to dequeue a cell with identifier \(type.reuseIdentifier) matching type \(type.self). 🤦🏼‍♂️")
        }
        
        return cell
    }
    
    func register<T: UICollectionReusableView>(supplementaryViewType: T.Type, ofKind elementKind: String)
        where T: Reusable & NibLoadable {
            self.register(
                supplementaryViewType.nib,
                forSupplementaryViewOfKind: elementKind,
                withReuseIdentifier: supplementaryViewType.reuseIdentifier
            )
    }
    
    func register<T: UICollectionReusableView>(supplementaryViewType: T.Type, ofKind elementKind: String)
        where T: Reusable {
            self.register(
                supplementaryViewType.self,
                forSupplementaryViewOfKind: elementKind,
                withReuseIdentifier: supplementaryViewType.reuseIdentifier
            )
    }
    
    final func dequeueReusableSupplementaryView<T: UICollectionReusableView>
        (ofKind elementKind: String, for indexPath: IndexPath, viewType: T.Type = T.self) -> T
        where T: Reusable {
            let view = self.dequeueReusableSupplementaryView(
                ofKind: elementKind,
                withReuseIdentifier: viewType.reuseIdentifier,
                for: indexPath
            )
            guard let typedView = view as? T else {
                fatalError( "Failed to dequeue a supplementary view with identifier \(viewType.reuseIdentifier) "
                    + "matching type \(viewType.self). ")
            }
            return typedView
    }
}
