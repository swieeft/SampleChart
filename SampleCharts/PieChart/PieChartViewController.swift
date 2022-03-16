//
//  PieChartViewController.swift
//  SampleCharts
//
//  Created by gili on 2022/03/11.
//

import UIKit

class PieChartViewController: UIViewController {
    
    @IBOutlet weak var chartView: PieChartView!
    
    @IBOutlet weak var foodFilterButton: FilterButton!
    @IBOutlet weak var sleepFilterButton: FilterButton!
    @IBOutlet weak var defecationFilterButton: FilterButton!
    
    @IBOutlet weak var firstDataButton: MockDataButton!
    @IBOutlet weak var secondDataButton: MockDataButton!
    @IBOutlet weak var thirdDataButton: MockDataButton!
    @IBOutlet weak var fourthDataButton: MockDataButton!
    @IBOutlet weak var fifthDataButton: MockDataButton!
    
    private lazy var dataButtons: [MockDataButton] = [firstDataButton,
                                                      secondDataButton,
                                                      thirdDataButton,
                                                      fourthDataButton,
                                                      fifthDataButton]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        foodFilterButton.layer.cornerRadius = 6
        foodFilterButton.layer.masksToBounds = true
        
        sleepFilterButton.layer.cornerRadius = 6
        sleepFilterButton.layer.masksToBounds = true
        
        defecationFilterButton.layer.cornerRadius = 6
        defecationFilterButton.layer.masksToBounds = true
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
    
    @IBAction func firstDataSet(_ sender: MockDataButton) {
//        let datas = [ChartData(type: .sleep, time: ChartData.Time(startH: 0, startM: 0, endH: 8, endM: 30)),
//                           ChartData(type: .food, time: ChartData.Time(startH: 9, startM: 0, endH: 9, endM: 30)),
//                           ChartData(type: .defecation, time: ChartData.Time(startH: 10, startM: 30, endH: 10, endM: 35)),
//                           ChartData(type: .sleep, time: ChartData.Time(startH: 11, startM: 5, endH: 12, endM: 53)),
//                           ChartData(type: .food, time: ChartData.Time(startH: 13, startM: 0, endH: 13, endM: 30)),
//                           ChartData(type: .defecation, time: ChartData.Time(startH: 14, startM: 10, endH: 14, endM: 15)),
//                           ChartData(type: .sleep, time: ChartData.Time(startH: 14, startM: 45, endH: 16, endM: 0)),
//                           ChartData(type: .defecation, time: ChartData.Time(startH: 16, startM: 0, endH: 16, endM: 05)),
//                           ChartData(type: .food, time: ChartData.Time(startH: 18, startM: 0, endH: 18, endM: 30)),
//                           ChartData(type: .defecation, time: ChartData.Time(startH: 19, startM: 15, endH: 19, endM: 20)),
//                           ChartData(type: .food, time: ChartData.Time(startH: 20, startM: 0, endH: 20, endM: 30)),
//                           ChartData(type: .sleep, time: ChartData.Time(startH: 20, startM: 30, endH: 23, endM: 0))]
        
        let datas = [ChartData(type: .sleep, time: ChartData.Time(startH: 10, startM: 0, endH: 15, endM: 0)),
                     ChartData(type: .food, time: ChartData.Time(startH: 10, startM: 0, endH: 10, endM: 50)),
                     ChartData(type: .defecation, time: ChartData.Time(startH: 10, startM: 0, endH: 10, endM: 40)),
                     ChartData(type: .food, time: ChartData.Time(startH: 13, startM: 0, endH: 13, endM: 30)),
                     ChartData(type: .defecation, time: ChartData.Time(startH: 13, startM: 0, endH: 13, endM: 20))]
        
        setChartData(days: 100, datas: datas, button: sender)
    }
    
    @IBAction func secondDataSet(_ sender: MockDataButton) {
        let datas = [ChartData(type: .sleep, time: ChartData.Time(startH: 1, startM: 30, endH: 9, endM: 30)),
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
        
        setChartData(days: 120, datas: datas, button: sender)
    }
    
    @IBAction func thirdDataSet(_ sender: MockDataButton) {
        let datas = [ChartData(type: .sleep, time: ChartData.Time(startH: 0, startM: 0, endH: 3, endM: 23)),
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
        
        setChartData(days: 140, datas: datas, button: sender)
    }
    
    @IBAction func fourthDataSet(_ sender: MockDataButton) {
        let datas = [ChartData(type: .food, time: ChartData.Time(startH: 0, startM: 0, endH: 0, endM: 30)),
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
        
        setChartData(days: 160, datas: datas, button: sender)
    }
    
    @IBAction func fifthDataSet(_ sender: MockDataButton) {
        let datas = [ChartData(type: .defecation, time: ChartData.Time(startH: 1, startM: 50, endH: 1, endM: 55)),
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
        
        setChartData(days: 180, datas: datas, button: sender)
    }
    
    private func setChartData(days: Int, datas: [ChartData], button: MockDataButton) {
        chartView.days = days
        chartView.datas = datas
        setDataButtonsSelected(button)
    }
    
    private func setDataButtonsSelected(_ selectedButton: MockDataButton) {
        dataButtons.forEach { button in
            button.isSelected = button == selectedButton
        }
    }
}



