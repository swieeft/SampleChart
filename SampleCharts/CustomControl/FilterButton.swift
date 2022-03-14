//
//  FilterButton.swift
//  SampleCharts
//
//  Created by gili on 2022/03/14.
//

import UIKit

class FilterButton: UIButton {
    private var currentBackgroundColor: UIColor?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buttonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        buttonInit()
    }
    
    private func buttonInit() {
        currentBackgroundColor = backgroundColor
        
        layer.cornerRadius = 8
        layer.masksToBounds = true
        backgroundColor = isSelected ? currentBackgroundColor : .lightGray
    }
    
    override var isSelected: Bool {
        didSet {
            backgroundColor = isSelected ? currentBackgroundColor : .lightGray
        }
    }
}
