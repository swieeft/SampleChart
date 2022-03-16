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
    private var paths: [CGPath: ChartData] = [:]
    
    private let midnight = Date.createTime(hour: 0, minute: 0)
    private let emptyColor: UIColor = UIColor(red: 240 / 255, green: 242 / 255, blue: 246 / 255, alpha: 1)
    
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
        setUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUI()
    }
    
    private func setUI() {
        transform = CGAffineTransform(rotationAngle: ((3 * .pi) / 2))
        
        self.addSubview(label)
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        label.transform = CGAffineTransform(rotationAngle: -((3 * .pi) / 2))
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
        
        let centerPoint = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
        let startPoint = CGPoint(x: centerPoint.x * 1.5 , y: centerPoint.y)
        let radius = calculateRadius(center: centerPoint, start: startPoint)
        
        drawEmptyArc(centerPoint: centerPoint, radius: radius)

        datas.forEach { data in
            let startAngle = calculateStartAngle(beforeEndTime: midnight, currentStartTime: data.time.start)
            let endAngle = calculateEndAngle(startAngle: startAngle, angle: data.time.angle)
            
            if filter[data.type] == false {
                drawArc(centerPoint: centerPoint, radius: radius, startAngle: startAngle, endAngle: endAngle, data: data)
            }
        }
    }
    
    // 배경이 되는 빈 원형
    private func drawEmptyArc(centerPoint: CGPoint, radius: CGFloat) {
        let arc = UIBezierPath()
        arc.addArc(withCenter: centerPoint, radius: radius, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
        
        // 색상이나 두께는 디자인 가이드에 맞춰서 변경 필요
        emptyColor.setStroke()
        arc.lineWidth = 80
        arc.stroke()
        arc.close()
    }
    
    private func drawArc(centerPoint: CGPoint, radius: CGFloat, startAngle: CGFloat, endAngle: CGFloat, data: ChartData) {
        let arc = UIBezierPath()
        arc.addArc(withCenter: centerPoint, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        // 색상이나 두께는 디자인 가이드에 맞춰서 변경 필요
        data.type.color.setStroke()
        arc.lineWidth = 80
        arc.stroke()
        arc.close()
        
        // UIBezierPath로 touch event를 잡을 경우 lineWidth가 적용 안 된 부분만 touch가 잡혀서 strokingWithWidth로 path를 copy해서 저장함
        let copyArc = arc.cgPath.copy(strokingWithWidth: arc.lineWidth, lineCap: arc.lineCapStyle, lineJoin: arc.lineJoinStyle, miterLimit: arc.miterLimit)
        
        paths[copyArc] = data
    }
    
    // MARK: - Calculate
    private func calculateRadius(center: CGPoint, start: CGPoint) -> CGFloat {
        let xDist: CGFloat = start.x - center.x
        let yDist: CGFloat = start.y - center.y

        let radius: CGFloat = sqrt((xDist * xDist) + (yDist * yDist))

        return radius
    }
    
    private func calculateStartAngle(beforeEndTime end: Date, currentStartTime start: Date) -> CGFloat {
        let angle = CGFloat(start.totalMinute - end.totalMinute) * 0.00436
        return angle
    }
    
    private func calculateEndAngle(startAngle: CGFloat, angle: CGFloat) -> CGFloat {
        return (angle * (.pi / 180)) + startAngle
    }
    
    // MARK: - Action
    func hiddenAction(type: ChartData.DataType, isHidden: Bool) {
        filter[type] = isHidden
        setNeedsDisplay()
    }
}

