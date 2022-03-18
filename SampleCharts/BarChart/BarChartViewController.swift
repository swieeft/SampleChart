//
//  BarChartViewController.swift
//  SampleCharts
//
//  Created by gili on 2022/03/11.
//

import UIKit

class BarChartViewController: UIViewController {
    @IBOutlet weak var chartView: BarChartView!
    
    @IBOutlet weak var foodFilterButton: FilterButton!
    @IBOutlet weak var sleepFilterButton: FilterButton!
    @IBOutlet weak var defecationFilterButton: FilterButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        let data1 = [ChartData(type: .sleep, time: ChartData.Time(startH: 10, startM: 0, endH: 15, endM: 0)),
                     ChartData(type: .food, time: ChartData.Time(startH: 10, startM: 0, endH: 10, endM: 50)),
                     ChartData(type: .defecation, time: ChartData.Time(startH: 10, startM: 0, endH: 10, endM: 40)),
                     ChartData(type: .food, time: ChartData.Time(startH: 13, startM: 0, endH: 13, endM: 30)),
                     ChartData(type: .defecation, time: ChartData.Time(startH: 13, startM: 0, endH: 13, endM: 20))]
        
        let data2 = [ChartData(type: .sleep, time: ChartData.Time(startH: 1, startM: 30, endH: 9, endM: 30)),
                     ChartData(type: .food, time: ChartData.Time(startH: 9, startM: 30, endH: 10, endM: 0)),
                     ChartData(type: .defecation, time: ChartData.Time(startH: 10, startM: 50, endH: 10, endM: 55)),
                     ChartData(type: .sleep, time: ChartData.Time(startH: 12, startM: 0, endH: 13, endM: 0)),
                     ChartData(type: .food, time: ChartData.Time(startH: 13, startM: 0, endH: 13, endM: 30)),
                     ChartData(type: .defecation, time: ChartData.Time(startH: 15, startM: 13, endH: 15, endM: 18)),
                     ChartData(type: .defecation, time: ChartData.Time(startH: 16, startM: 0, endH: 16, endM: 05)),
                     ChartData(type: .sleep, time: ChartData.Time(startH: 17, startM: 0, endH: 18, endM: 08)),
                     ChartData(type: .defecation, time: ChartData.Time(startH: 18, startM: 08, endH: 18, endM: 13)),
                     ChartData(type: .food, time: ChartData.Time(startH: 18, startM: 20, endH: 18, endM: 50)),
                     ChartData(type: .defecation, time: ChartData.Time(startH: 19, startM: 15, endH: 19, endM: 20)),
                     ChartData(type: .sleep, time: ChartData.Time(startH: 19, startM: 40, endH: 20, endM: 20)),
                     ChartData(type: .food, time: ChartData.Time(startH: 20, startM: 20, endH: 20, endM: 50)),
                     ChartData(type: .sleep, time: ChartData.Time(startH: 21, startM: 30, endH: 24, endM: 0))]
        
        let data3 = [ChartData(type: .sleep, time: ChartData.Time(startH: 0, startM: 0, endH: 8, endM: 30)),
                     ChartData(type: .food, time: ChartData.Time(startH: 9, startM: 0, endH: 9, endM: 30)),
                     ChartData(type: .defecation, time: ChartData.Time(startH: 10, startM: 30, endH: 10, endM: 35)),
                     ChartData(type: .sleep, time: ChartData.Time(startH: 11, startM: 5, endH: 12, endM: 53)),
                     ChartData(type: .food, time: ChartData.Time(startH: 13, startM: 0, endH: 13, endM: 30)),
                     ChartData(type: .defecation, time: ChartData.Time(startH: 14, startM: 10, endH: 14, endM: 15)),
                     ChartData(type: .sleep, time: ChartData.Time(startH: 14, startM: 45, endH: 16, endM: 0)),
                     ChartData(type: .defecation, time: ChartData.Time(startH: 16, startM: 0, endH: 16, endM: 05)),
                     ChartData(type: .food, time: ChartData.Time(startH: 18, startM: 0, endH: 18, endM: 30)),
                     ChartData(type: .defecation, time: ChartData.Time(startH: 19, startM: 15, endH: 19, endM: 20)),
                     ChartData(type: .food, time: ChartData.Time(startH: 20, startM: 0, endH: 20, endM: 30)),
                     ChartData(type: .sleep, time: ChartData.Time(startH: 20, startM: 30, endH: 23, endM: 0))]
        
        let data4 = [ChartData(type: .sleep, time: ChartData.Time(startH: 0, startM: 0, endH: 3, endM: 23)),
                     ChartData(type: .sleep, time: ChartData.Time(startH: 3, startM: 50, endH: 6, endM: 08)),
                     ChartData(type: .sleep, time: ChartData.Time(startH: 6, startM: 30, endH: 9, endM: 30)),
                     ChartData(type: .food, time: ChartData.Time(startH: 9, startM: 50, endH: 10, endM: 20)),
                     ChartData(type: .defecation, time: ChartData.Time(startH: 10, startM: 33, endH: 10, endM: 38)),
                     ChartData(type: .defecation, time: ChartData.Time(startH: 12, startM: 10, endH: 12, endM: 25)),
                     ChartData(type: .sleep, time: ChartData.Time(startH: 12, startM: 30, endH: 13, endM: 20)),
                     ChartData(type: .food, time: ChartData.Time(startH: 13, startM: 20, endH: 13, endM: 50)),
                     ChartData(type: .defecation, time: ChartData.Time(startH: 14, startM: 30, endH: 14, endM: 35)),
                     ChartData(type: .sleep, time: ChartData.Time(startH: 15, startM: 50, endH: 17, endM: 05)),
                     ChartData(type: .food, time: ChartData.Time(startH: 17, startM: 05, endH: 17, endM: 35)),
                     ChartData(type: .defecation, time: ChartData.Time(startH: 18, startM: 21, endH: 18, endM: 26)),
                     ChartData(type: .food, time: ChartData.Time(startH: 20, startM: 30, endH: 21, endM: 0)),
                     ChartData(type: .sleep, time: ChartData.Time(startH: 21, startM: 30, endH: 23, endM: 30))]
        
        let data5 = [ChartData(type: .food, time: ChartData.Time(startH: 0, startM: 0, endH: 0, endM: 30)),
                     ChartData(type: .sleep, time: ChartData.Time(startH: 1, startM: 20, endH: 5, endM: 40)),
                     ChartData(type: .sleep, time: ChartData.Time(startH: 6, startM: 0, endH: 8, endM: 45)),
                     ChartData(type: .food, time: ChartData.Time(startH: 8, startM: 50, endH: 9, endM: 20)),
                     ChartData(type: .defecation, time: ChartData.Time(startH: 10, startM: 0, endH: 10, endM: 05)),
                     ChartData(type: .defecation, time: ChartData.Time(startH: 11, startM: 35, endH: 11, endM: 40)),
                     ChartData(type: .food, time: ChartData.Time(startH: 12, startM: 10, endH: 12, endM: 40)),
                     ChartData(type: .sleep, time: ChartData.Time(startH: 13, startM: 0, endH: 15, endM: 0)),
                     ChartData(type: .defecation, time: ChartData.Time(startH: 15, startM: 0, endH: 15, endM: 05)),
                     ChartData(type: .food, time: ChartData.Time(startH: 16, startM: 0, endH: 16, endM: 30)),
                     ChartData(type: .sleep, time: ChartData.Time(startH: 17, startM: 30, endH: 19, endM: 0)),
                     ChartData(type: .defecation, time: ChartData.Time(startH: 20, startM: 05, endH: 20, endM: 10)),
                     ChartData(type: .food, time: ChartData.Time(startH: 20, startM: 30, endH: 21, endM: 0)),
                     ChartData(type: .sleep, time: ChartData.Time(startH: 21, startM: 20, endH: 24, endM: 0))]
        
        let data6 = [ChartData(type: .defecation, time: ChartData.Time(startH: 1, startM: 50, endH: 1, endM: 55)),
                     ChartData(type: .food, time: ChartData.Time(startH: 2, startM: 0, endH: 2, endM: 30)),
                     ChartData(type: .sleep, time: ChartData.Time(startH: 2, startM: 40, endH: 6, endM: 30)),
                     ChartData(type: .food, time: ChartData.Time(startH: 6, startM: 30, endH: 7, endM: 00)),
                     ChartData(type: .sleep, time: ChartData.Time(startH: 7, startM: 10, endH: 9, endM: 30)),
                     ChartData(type: .defecation, time: ChartData.Time(startH: 9, startM: 30, endH: 9, endM: 35)),
                     ChartData(type: .food, time: ChartData.Time(startH: 11, startM: 0, endH: 11, endM: 30)),
                     ChartData(type: .sleep, time: ChartData.Time(startH: 12, startM: 0, endH: 13, endM: 30)),
                     ChartData(type: .defecation, time: ChartData.Time(startH: 13, startM: 30, endH: 13, endM: 35)),
                     ChartData(type: .food, time: ChartData.Time(startH: 15, startM: 0, endH: 15, endM: 30)),
                     ChartData(type: .sleep, time: ChartData.Time(startH: 16, startM: 10, endH: 18, endM: 0)),
                     ChartData(type: .food, time: ChartData.Time(startH: 19, startM: 40, endH: 20, endM: 10)),
                     ChartData(type: .defecation, time: ChartData.Time(startH: 20, startM: 30, endH: 20, endM: 35)),
                     ChartData(type: .sleep, time: ChartData.Time(startH: 21, startM: 0, endH: 23, endM: 30))]
        
        let data7 = [ChartData(type: .sleep, time: ChartData.Time(startH: 10, startM: 0, endH: 15, endM: 0)),
                     ChartData(type: .food, time: ChartData.Time(startH: 10, startM: 0, endH: 10, endM: 50)),
                     ChartData(type: .defecation, time: ChartData.Time(startH: 10, startM: 0, endH: 10, endM: 40)),
                     ChartData(type: .food, time: ChartData.Time(startH: 13, startM: 0, endH: 13, endM: 30)),
                     ChartData(type: .defecation, time: ChartData.Time(startH: 13, startM: 0, endH: 13, endM: 20))]
        
        let today = Date()
        let datas: [WeekData] = [WeekData(date: Calendar.current.date(byAdding: .day, value: -6, to: today)!, datas: data1),
                                 WeekData(date: Calendar.current.date(byAdding: .day, value: -5, to: today)!, datas: data2),
                                 WeekData(date: Calendar.current.date(byAdding: .day, value: -4, to: today)!, datas: data3),
                                 WeekData(date: Calendar.current.date(byAdding: .day, value: -3, to: today)!, datas: data4),
                                 WeekData(date: Calendar.current.date(byAdding: .day, value: -2, to: today)!, datas: data5),
                                 WeekData(date: Calendar.current.date(byAdding: .day, value: -1, to: today)!, datas: data6),
                                 WeekData(date: today, datas: data7)]
        
        chartView.datas = datas
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @IBAction func foodFilter(_ sender: FilterButton) {
        sender.isSelected = !sender.isSelected
        setFilter(type: .food, isHidden: !sender.isSelected)
    }
    
    @IBAction func sleepFilter(_ sender: FilterButton) {
        sender.isSelected = !sender.isSelected
        setFilter(type: .sleep, isHidden: !sender.isSelected)
    }
    
    @IBAction func defecationFilter(_ sender: FilterButton) {
        sender.isSelected = !sender.isSelected
        setFilter(type: .defecation, isHidden: !sender.isSelected)
    }
    
    private func setFilter(type: ChartData.DataType, isHidden: Bool) {
        chartView.hiddenAction(type: type, isHidden: isHidden)
    }
}
