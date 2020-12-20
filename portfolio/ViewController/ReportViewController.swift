//
//  ReportViewController.swift
//  portfolio
//
//  Created by 永井涼 on 2020/12/16.
//

import UIKit
import Charts
class ReportViewController: UIViewController {
    
    @IBOutlet weak var chartView: UIView!
    @IBOutlet weak var workView: UIView!
    @IBOutlet weak var resultTableView: UITableView!
    @IBOutlet weak var resultLineChartView: LineChartView!
    
    
    let unitsSold = [10.0, 4.0, 6.0, 3.0, 12.0, 16.0]
    override func viewDidLoad() {
        super.viewDidLoad()
        cornerRadius()
        setupResultTableView()
        setLineGraph()
    }
    
    func setupResultTableView() {
        resultTableView.dataSource = self
        resultTableView.delegate = self
        resultTableView.register(UINib(nibName: ReportTableViewCell.className, bundle: nil), forCellReuseIdentifier: ReportTableViewCell.className)
    }
    
    func cornerRadius() {
        workView.layer.cornerRadius = 20.0
        chartView.layer.cornerRadius = 20.0
        resultTableView.layer.cornerRadius = 20.0
    }
    
    func setLineGraph(){
            var entry = [ChartDataEntry]()
            
            for (i,d) in unitsSold.enumerated(){
                entry.append(ChartDataEntry(x: Double(i),y: d))
            }
            
            let dataset = LineChartDataSet(entries: entry,label: "Units Sold")
                    
            resultLineChartView.data = LineChartData(dataSet: dataset)
            resultLineChartView.chartDescription?.text = "Item Sold Chart"
        }
    
    
}

extension ReportViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

}

extension ReportViewController :UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let homeTableViewCell = tableView.dequeueReusableCell(withIdentifier: ReportTableViewCell.className, for: indexPath) as? ReportTableViewCell else {
            return UITableViewCell()
        }
        homeTableViewCell.dateLabel.text = "12月25日"
        homeTableViewCell.timerLabel.text = "01:23:45"
        homeTableViewCell.categoryLabel.text = "勉強"
        
        return homeTableViewCell
        
        
        
    }
}
