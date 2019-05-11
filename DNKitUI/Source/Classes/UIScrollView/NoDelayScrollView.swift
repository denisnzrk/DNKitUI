//
//  NoDelayScrollView.swift
//  ndkitUI
//
//  Created by NAZARENKO Denis on 31/03/2019.
//

import Foundation

import UIKit.UIScrollView

// Данная таблица решает проблему с кнопками внутри UIScrollView при delaysContentTouches = false.
// Для того, чтобы без задержки отрабатывал highlight компонентов мы устанавливаем флаг delaysContentTouches = false.
// Используя его, при касании UIButton не происходит скроллинга.
// C перегруженным методом touchesShouldCancel все ок :)

open class NoDelayScrollView: UIScrollView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        onInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        onInit()
    }
    
    override open func touchesShouldCancel(in view: UIView) -> Bool {
        return view is UIButton ? true : super.touchesShouldCancel(in: view)
    }
}

private extension NoDelayScrollView {
    func onInit() {
        delaysContentTouches = false
    }
}
