//
//  MockDataButton.swift
//  SampleCharts
//
//  Created by gili on 2022/03/14.
//

import UIKit

class MockDataButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        buttonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        buttonInit()
    }
    
    private func buttonInit() {
        layer.cornerRadius = 8
        layer.masksToBounds = true
        backgroundColor = isSelected ? .darkGray : .lightGray
    }
    
    override var isSelected: Bool {
        didSet {
            backgroundColor = isSelected ? .darkGray : .lightGray
        }
    }
}

