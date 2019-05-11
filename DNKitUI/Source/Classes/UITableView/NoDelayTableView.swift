//
//  NoDelayTableView.swift
//  ndkitUI
//
//  Created by NAZARENKO Denis on 31/03/2019.
//

import UIKit.UITableView

// Данная таблица решает проблему с кнопками внутри UITableView при delaysContentTouches = false.
// Для того, чтобы без задержки отрабатывал highlight компонентов мы устанавливаем флаг delaysContentTouches = false.
// Используя его, при касании UIButton не происходит скроллинга.
// C перегруженным методом touchesShouldCancel все ок :)

open class NoDelayTableView: UITableView {
    
    public override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
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

// MARK: Setup
private extension NoDelayTableView {
    func onInit() {
        delaysContentTouches = false
    }
}

