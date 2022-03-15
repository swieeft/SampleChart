//
//  PieChartView.swift
//  SampleCharts
//
//  Created by gili on 2022/03/11.
//

import UIKit

class PieChartView: UIView {
    private var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "D+\n0"
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    private var filter: [ChartData.DataType: Bool] = [.food: false, .sleep: false, .defecation: false]
    private let midnight = Date.createTime(hour: 24, minute: 0)
    private let emptyColor: UIColor = UIColor(red: 240 / 255, green: 242 / 255, blue: 246 / 255, alpha: 1)
    
    private var centerPoint: CGPoint = CGPoint(x: 0, y: 0)
    private var startPoint: CGPoint = CGPoint(x: 0, y: 0)
    private var startAngle: CGFloat = 0
    private var radius: CGFloat = 0
    
    
    var paths: [CGPath: ChartData] = [:]
    
    var days: Int = 0 {
        didSet {
            label.text = "D+\n\(days)"
        }
    }
    
    var datas: [ChartData] = [] {
        didSet {
            setNeedsDisplay()
        }
    }
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLabel()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setLabel()
    }
    
    private func setLabel() {
        self.addSubview(label)
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
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
    
    // MARK: - Draw
    override func draw(_ rect: CGRect) {
        paths.removeAll()
        
        centerPoint = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
        // 차트 시작 포인트 - 0시
        startPoint = CGPoint(x: centerPoint.x, y: centerPoint.y * 0.55)
        radius = calculateRadius(center: centerPoint, start: startPoint)
        startAngle = calculateStartAngle(center: centerPoint, point: startPoint, radius: radius)
        
//        let arc = UIBezierPath()
//        arc.move(to: startPoint)
//        arc.addArc(withCenter: centerPoint, radius: radius, startAngle: startAngle, endAngle: ((3 * .pi) / 2), clockwise: true)
//
//        // 색상이나 두께는 디자인 가이드에 맞춰서 변경 필요
//        emptyColor.setStroke()
//        arc.lineWidth = 100
//        arc.stroke()
        
//        paths.append(arc)
        
        if datas.count > 0 {
            drawEmptyStartTime()

            var beforeData: ChartData?

            datas.forEach { data in
                // 이전 데이터의 종료 시간과 현재 데이터의 시작 시간이 다르다면 중간에 빈 값을 그려줌
                if let beforeData = beforeData, beforeData.time.end.totalMinute != data.time.start.totalMinute {
                    drawEmptyTime(beforeEndTime: beforeData.time.end, currentStartTime: data.time.start)
                }

                drawDataTime(data: data)
                beforeData = data
            }

            drawEmptyEndTime(beforeData: beforeData)
        } else {
            drawArc(endAngle: (3 * .pi) / 2, color: emptyColor, data: nil)
        }
    }
    
    // 0시 부터 데이터가 시작되지 않을 경우 첫 시작 데이터까지 빈 값을 그려줌
    private func drawEmptyStartTime() {
        let data = datas[0]
        
        if data.time.start.totalMinute > 0 {
            let angle = CGFloat(data.time.start.totalMinute) * 0.25
            let endAngle = calculateEndAngle(startAngle: startAngle, angle: angle)

            drawArc(endAngle: endAngle, color: emptyColor, data: nil)
        }
    }
    
    // 데이터 중간 중간 빈 값을 그려줌
    private func drawEmptyTime(beforeEndTime end: Date, currentStartTime start: Date) {
        let angle = calculateEmptyAngle(beforeEndTime: end, currentStartTime: start)
        let endAngle = calculateEndAngle(startAngle: startAngle, angle: angle)

        drawArc(endAngle: endAngle, color: emptyColor, data: nil)
    }
    
    // 입력된 데이터를 그려줌
    private func drawDataTime(data: ChartData) {
        let endAngle = calculateEndAngle(startAngle: startAngle, angle: data.time.angle)
        let color = filter[data.type] == true ? emptyColor : data.type.color

        drawArc(endAngle: endAngle, color: color, data: data)
    }
    
    // 마지막 데이터가 24시로 끝나지 않을 경우 마지막 데이터의 끝 시간부터 24시까지 빈 값을 그려줌
    private func drawEmptyEndTime(beforeData: ChartData?) {
        if let beforeData = beforeData, beforeData.time.end.totalMinute != midnight.totalMinute {
            let angle = calculateEmptyAngle(beforeEndTime: beforeData.time.end, currentStartTime: midnight)
            let endAngle = calculateEndAngle(startAngle: startAngle, angle: angle)
            
            drawArc(endAngle: endAngle, color: emptyColor, data: nil)
        }
    }

    // 실제 Arc를 그려 데이터를 표시
    private func drawArc(endAngle: CGFloat, color: UIColor, data: ChartData?) {
        let arc = UIBezierPath()
        arc.move(to: startPoint)
        arc.addArc(withCenter: centerPoint, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        // 색상이나 두께는 디자인 가이드에 맞춰서 변경 필요
        color.setStroke()
        arc.lineWidth = 100
        arc.stroke()
        
        // UIBezierPath로 touch event를 잡을 경우 lineWidth가 적용 안 된 부분만 touch가 잡혀서 strokingWithWidth로 path를 copy해서 저장함
        let copyArc = arc.cgPath.copy(strokingWithWidth: arc.lineWidth, lineCap: arc.lineCapStyle, lineJoin: arc.lineJoinStyle, miterLimit: arc.miterLimit)
        
        if let data = data {
            paths[copyArc] = data
        }
        
        startPoint = arc.currentPoint
        startAngle = endAngle
    }
    
    // MARK: - Calculate
    private func calculateRadius(center: CGPoint, start: CGPoint) -> CGFloat {
        let xDist: CGFloat = start.x - center.x
        let yDist: CGFloat = start.y - center.y

        let radius: CGFloat = sqrt((xDist * xDist) + (yDist * yDist))

        return radius
    }
    
    private func calculateStartAngle(center: CGPoint, point: CGPoint, radius: CGFloat) -> CGFloat {
        let origin = CGPoint(x: center.x + radius, y: center.y)

        let v1 = CGVector(dx: origin.x - center.x, dy: origin.y - center.y)
        let v2 = CGVector(dx: point.x - center.x, dy: point.y - center.y)

        let angle = atan2(v2.dy, v2.dx) - atan2(v1.dy, v1.dx)

        return angle
    }
    
    private func calculateEndAngle(startAngle: CGFloat, angle: CGFloat) -> CGFloat {
        return (angle * (.pi / 180)) + startAngle
    }
    
    private func calculateEmptyAngle(beforeEndTime end: Date, currentStartTime start: Date) -> CGFloat {
        let angle = CGFloat(start.totalMinute - end.totalMinute) * 0.25
        return angle
    }
    
    // MARK: - Action
    func hiddenAction(type: ChartData.DataType, isHidden: Bool) {
        filter[type] = isHidden
        setNeedsDisplay()
    }
}

