//
//  Date+Extension.swift
//  SampleCharts
//
//  Created by gili on 2022/03/11.
//

import UIKit

extension Date {
    var hour: Int {
        let calendar = Calendar.current
        return calendar.component(.hour, from: self)
    }
    
    var minute: Int {
        let calendar = Calendar.current
        return calendar.component(.minute, from: self)
    }
    
    var totalMinute: Int {
        return (hour * 60) + minute
    }
    
    static func createTime(hour: Int, minute: Int) -> Date {
        let calendar = Calendar.current
        
        var dateComponents = DateComponents()
        dateComponents.hour = hour
        dateComponents.minute = minute
        return calendar.date(from: dateComponents)!
    }
}

