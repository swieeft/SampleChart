//
//  ChartData.swift
//  SampleCharts
//
//  Created by gili on 2022/03/11.
//

import UIKit

struct ChartData {
    let type: DataType
    let time: Time
    
    enum DataType {
        case food
        case sleep
        case defecation
        
        var color: UIColor {
            switch self {
            case .food:
                return UIColor(red: 234 / 255, green: 183 / 255, blue: 75 / 255, alpha: 1)
            case .sleep:
                return UIColor(red: 119 / 255, green: 118 / 255, blue: 174 / 255, alpha: 1)
            case .defecation:
                return UIColor(red: 186 / 255, green: 142 / 255, blue: 108 / 255, alpha: 1)
            }
        }
    }
    
    struct Time {
        let start: Date
        let end: Date
        
        init(startH: Int, startM: Int, endH: Int, endM: Int) {
            self.start = Date.createTime(hour: startH, minute: startM)
            self.end = Date.createTime(hour: endH, minute: endM)
        }
        
        var angle: CGFloat {
            return CGFloat(end.totalMinute - start.totalMinute) * 0.25
        }
    }
}

