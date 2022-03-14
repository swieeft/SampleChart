//
//  BarChartView.swift
//  SampleCharts
//
//  Created by gili on 2022/03/11.
//

import UIKit

class BarChartView: UIView {
    private var timeLineStackView: UIStackView = UIStackView()
    private var weekDayStackView: UIStackView = UIStackView()
    private var chartStackView: UIStackView = UIStackView()
    
    private var chartViews: [SubBarView] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setTimeLine()
        setWeekDay()
        setChart()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setTimeLine()
        setWeekDay()
        setChart()
    }
    
    private func setTimeLine() {
        let font: UIFont = .systemFont(ofSize: 12, weight: .medium)
        
        timeLineStackView = UIStackView()
        timeLineStackView.translatesAutoresizingMaskIntoConstraints = false
        timeLineStackView.alignment = .fill
        timeLineStackView.axis = .vertical
        timeLineStackView.spacing = ((self.frame.height - 30) - CGFloat(font.lineHeight * 9)) / 10

        for i in 0..<9 {
            let time = i * 3
            
            let label = UILabel()
            label.text = 10 > time ? "0\(time)" : "\(time)"
            label.textColor = .lightGray
            label.font = font
            label.sizeToFit()
            timeLineStackView.addArrangedSubview(label)
        }
        
        self.addSubview(timeLineStackView)
        timeLineStackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        timeLineStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30).isActive = true
        timeLineStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -18).isActive = true
        timeLineStackView.widthAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    private func setWeekDay() {
        let font: UIFont = .systemFont(ofSize: 12, weight: .medium)
        
        weekDayStackView = UIStackView()
        weekDayStackView.translatesAutoresizingMaskIntoConstraints = false
        weekDayStackView.alignment = .fill
        weekDayStackView.distribution = .fillEqually
        weekDayStackView.axis = .horizontal
        weekDayStackView.spacing = 5

        for i in 0..<7 {
            let label = UILabel()
            label.text = "\(i + 1)일"
            label.textColor = .lightGray
            label.font = font
            label.textAlignment = .center
            weekDayStackView.addArrangedSubview(label)
        }
        
        self.addSubview(weekDayStackView)
        weekDayStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        weekDayStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 18).isActive = true
        weekDayStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -43).isActive = true
        weekDayStackView.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    private func setChart() {
        let font: UIFont = .systemFont(ofSize: 12, weight: .medium)
        
        chartStackView = UIStackView()
        chartStackView.translatesAutoresizingMaskIntoConstraints = false
        chartStackView.alignment = .fill
        chartStackView.distribution = .fillEqually
        chartStackView.axis = .horizontal
        chartStackView.spacing = 5
        
        for _ in 0..<7 {
            let view = SubBarView()
            view.backgroundColor = UIColor(red: 240 / 255, green: 242 / 255, blue: 246 / 255, alpha: 1)

            chartStackView.addArrangedSubview(view)
            
            chartViews.append(view)
        }
        
        self.addSubview(chartStackView)
        chartStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: font.lineHeight / 2).isActive = true
        chartStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -35).isActive = true
        chartStackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 18).isActive = true
        chartStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -43).isActive = true
    }
}

class SubBarView: UIView {
    let datas: [ChartData] = [ChartData(type: .sleep, time: ChartData.Time(startH: 0, startM: 0, endH: 8, endM: 30)),
                              ChartData(type: .food, time: ChartData.Time(startH: 9, startM: 0, endH: 9, endM: 30)),
                              ChartData(type: .defecation, time: ChartData.Time(startH: 10, startM: 30, endH: 10, endM: 35)),
                              ChartData(type: .sleep, time: ChartData.Time(startH: 11, startM: 5, endH: 12, endM: 53)),
                              ChartData(type: .food, time: ChartData.Time(startH: 13, startM: 0, endH: 13, endM: 30)),
                              ChartData(type: .defecation, time: ChartData.Time(startH: 14, startM: 10, endH: 14, endM: 15)),
                              ChartData(type: .sleep, time: ChartData.Time(startH: 14, startM: 45, endH: 16, endM: 00)),
                              ChartData(type: .defecation, time: ChartData.Time(startH: 16, startM: 00, endH: 16, endM: 05)),
                              ChartData(type: .food, time: ChartData.Time(startH: 18, startM: 00, endH: 18, endM: 30)),
                              ChartData(type: .defecation, time: ChartData.Time(startH: 19, startM: 15, endH: 19, endM: 20)),
                              ChartData(type: .food, time: ChartData.Time(startH: 20, startM: 00, endH: 20, endM: 30)),
                              ChartData(type: .sleep, time: ChartData.Time(startH: 20, startM: 30, endH: 23, endM: 59))]
    
    override func draw(_ rect: CGRect) {
        let midX = frame.midX
        
        
        
        let line = UIBezierPath()
        line.move(to: CGPoint(x: frame.midX, y: 0))
        line.addLine(to: CGPoint(x: frame.midX, y: 100))
        
        UIColor.blue.setStroke()
        line.lineWidth = frame.width
        line.stroke()
    }
}
