//
//  BarChartView.swift
//  SampleCharts
//
//  Created by gili on 2022/03/11.
//

import UIKit

class BarChartView: UIView {
    var datas: [WeekData] = [] {
        didSet {
            setNeedsDisplay()
        }
    }
    
    private var filter: [ChartData.DataType: Bool] = [.food: false, .sleep: false, .defecation: false]
    private var paths: [UIBezierPath: ChartData] = [:]
    
    private let font: UIFont = .systemFont(ofSize: 12, weight: .medium)
    private var attrs: [NSAttributedString.Key: Any] {
        return [.font: font, .foregroundColor: UIColor.lightGray]
    }
    
    private let timeLineCount: Int = 9
    private let bottomMargin: CGFloat = 30
    
    private let chartLeading: CGFloat = 18
    private let chartTrailing: CGFloat = 43 // Time Line Margin 38 + 5
    private let chartMargin: CGFloat = 5
    
    private var timeMargin: CGFloat {
        let totalHeight = frame.height - (bottomMargin + (font.lineHeight * CGFloat(timeLineCount)))
        // 마지막 값은 Margin이 없기 때문에 8로 나눔
        return totalHeight / 8
    }
    
    private var chartWidth: CGFloat {
        // 마진을 6만 곱해주는 이유는 마지막 날은 마진 값이 없기 때문
        let totalWidth = frame.width - (chartLeading + chartTrailing + (chartMargin * 6))
        return totalWidth / 7
    }
    
    private var chartHeight: CGFloat {
        // TimeLine Count : 9 -> 마지막 1은 포함되어야 되기 때문에 8만 뺴줌
        // Bottom Margin + TimeLine Count = 38
        // (fontHeight / 2) : 00시 Time Line의 가운데서부터 차트가 시작해야 되기 때문에 폰트 높이의 절반부터 시작
        return frame.height - (bottomMargin + CGFloat(timeLineCount - 1)) - (font.lineHeight / 2)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.location(in: self)
            paths.forEach { key, value in
                if key.contains(position) {
                    print("\(value.type)")
                }
            }
        }
    }
    
    override func draw(_ rect: CGRect) {
        setTime()
        setWeekDay()
        setEmptyChart()
        setChart()
        setTimeLine()
    }
    
    // 주간 날짜
    private func setWeekDay() {
        var x: CGFloat = chartLeading
        
        datas.forEach { data in
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            
            var attrs = self.attrs
            attrs[.paragraphStyle] = paragraphStyle
            
            let str: NSString = "\(data.date.days)일" as NSString
            
            str.draw(with: CGRect(x: x, y: (frame.height - bottomMargin), width: chartWidth, height: 30),
                     options: .usesLineFragmentOrigin,
                     attributes: attrs,
                     context: nil)
            
            x = x + (chartWidth + chartMargin)
        }
    }
    
    // 차트의 배경이 되는 빈 차트
    private func setEmptyChart() {
        var x: CGFloat = chartLeading
        let y: CGFloat = font.lineHeight / 2
        
        for _ in 0..<7 {
            let path = UIBezierPath(rect: CGRect(x: x, y: y, width: chartWidth, height: chartHeight))
            
            UIColor(red: 245 / 255, green: 245 / 255, blue: 245 / 255, alpha: 1).setFill()
            
            path.fill()
            
            x = x + (chartWidth + 5)
        }
    }
    
    private func setChart() {
        var x: CGFloat = chartLeading
        let y: CGFloat = font.lineHeight / 2
        
        let minuteHeight = chartHeight / (24 * 60)
        
        datas.forEach { dayData in
            dayData.datas.forEach { data in
                if filter[data.type] == false {
                    let start = CGFloat(data.time.start.totalMinute) * minuteHeight
                    var end = CGFloat(data.time.end.totalMinute) * minuteHeight
                    
                    // 24시가 넘었을 경우의 케이스...
                    if start > end {
                        end = (24 * 60) * minuteHeight
                    }
                    
                    let height = end - start
                    
                    let path = UIBezierPath(rect: CGRect(x: x, y: y + start, width: chartWidth, height: height))
                    
                    data.type.color.setFill()
                    
                    path.fill()
                    
//                    let copyPath = path.cgPath.copy(strokingWithWidth: path.lineWidth, lineCap: path.lineCapStyle, lineJoin: path.lineJoinStyle, miterLimit: path.miterLimit)
                    
                    paths[path] = data
                }
            }
            
            x = x + (chartWidth + 5)
        }
    }
    
    // 시간대
    private func setTime() {
        let width: CGFloat = 20
        let trailing: CGFloat = width + 18
        
        var y: CGFloat = 0
        
        for i in 0..<9 {
            let time = i * 3
            let str: NSString = (10 > time ? "0\(time)" : "\(time)") as NSString
            
            str.draw(with: CGRect(x: frame.maxX - trailing, y: y, width: width, height: font.lineHeight),
                     options: .usesLineFragmentOrigin,
                     attributes: attrs,
                     context: nil)
            
            y = y + (timeMargin + font.lineHeight)
        }
    }
    
    // 시간대 별 표시 라인
    private func setTimeLine() {
        var y: CGFloat = font.lineHeight / 2
        
        for _ in 0..<9 {
            let path = UIBezierPath()
            path.move(to: CGPoint(x: chartLeading, y: y))
            path.addLine(to: CGPoint(x: frame.width - chartTrailing, y: y))
            
            UIColor(red: 150 / 255, green: 150 / 255, blue: 150 / 255, alpha: 0.2).setStroke()
            path.lineWidth = 1
            path.stroke()
            
            y = y + (timeMargin + font.lineHeight)
        }
    }
    
    func hiddenAction(type: ChartData.DataType, isHidden: Bool) {
        filter[type] = isHidden
        setNeedsDisplay()
    }
}

