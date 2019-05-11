//
//  NoDelayCollectionView.swift
//  ndkitUI
//
//  Created by NAZARENKO Denis on 31/03/2019.
//

import UIKit.UICollectionView

// Данная таблица решает проблему с кнопками внутри UICollectionView при delaysContentTouches = false.
// Для того, чтобы без задержки отрабатывал highlight компонентов мы устанавливаем флаг delaysContentTouches = false.
// Используя его, при касании UIButton не происходит скроллинга.
// C перегруженным методом touchesShouldCancel все ок :)

open class NoDelayCollectionView: UICollectionView {
    
    public override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        onInit()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        onInit()
    }
    
    override open func touchesShouldCancel(in view: UIView) -> Bool {
        return view is UIButton ? true : super.touchesShouldCancel(in: view)
    }
}

private extension NoDelayCollectionView {
    func onInit() {
        delaysContentTouches = false
    }
}
