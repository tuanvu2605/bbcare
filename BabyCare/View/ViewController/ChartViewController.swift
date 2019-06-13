//
//  ChartViewController.swift
//  BabyCare
//
//  Created by tuananhi on 5/29/19.
//  Copyright © 2019 tuananhi. All rights reserved.
//

import UIKit
import Charts
import SwiftyUserDefaults
import DateToolsSwift


enum ChartType {
    case weight
    case height
}

class ChartViewController: ScrollableViewController {

    var chartView: LineChartView!
    var data = [GrowthInfo]()
    var type : ChartType!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AppService.allGrowthInfo(["bbId":Defaults[.babyId]]) { (res) in
//            print("allGrowthInfo : \(res["data"])")
            if let data = res["data"] as? [[String : Any]] {
                for gDict in data {
                    let gInfo = GrowthInfo(dict: gDict)
                    self.data.append(gInfo)
                }
                self.setDataCount()
            }
        }
        
        
    }
    
    override func makeUI() {
                
        chartView = LineChartView(frame: CGRect(x: 0, y: 0, width: Size.screen.width, height: 200))
        chartView.delegate = self
        chartView.chartDescription?.enabled = false
        chartView.dragEnabled = true
        chartView.setScaleEnabled(true)
        chartView.pinchZoomEnabled = true
        
        
        // x-axis limit line
        let llXAxis = ChartLimitLine(limit: 10, label: "Index 10")
        llXAxis.lineWidth = 4
        llXAxis.lineDashLengths = [10, 10, 0]
        llXAxis.labelPosition = .bottomRight
        llXAxis.valueFont = .systemFont(ofSize: 10)
        
        chartView.xAxis.gridLineDashLengths = [10, 10]
        chartView.xAxis.gridLineDashPhase = 0
        chartView.xAxis.labelPosition = .bottom
        
        let leftAxis = chartView.leftAxis
        leftAxis.removeAllLimitLines()
        leftAxis.axisMaximum = type == .weight ? 10 : 100
        leftAxis.axisMinimum = 0
        leftAxis.gridLineDashLengths = [5, 5]
        leftAxis.drawLimitLinesBehindDataEnabled = true
        
        chartView.rightAxis.enabled = false
        
        let marker = BalloonMarker(color: UIColor(white: 180/255, alpha: 1),
                                   font: .systemFont(ofSize: 12),
                                   textColor: .white,
                                   insets: UIEdgeInsets(top: 8, left: 8, bottom: 20, right: 8))
        marker.chartView = chartView
        marker.minimumSize = CGSize(width: 80, height: 40)
        chartView.marker = marker
        
        chartView.legend.form = .line
        chartView.animate(xAxisDuration: 2.5)
        
        scrollView.addMoreView(view: chartView)
//        setDataCount(3, range: 100)
        
//        scrollView.addBlank(space: 12.0)
//        let notice = Notice()
//        notice.type = 1
//        notice.content = "Cân nặng so với tuổi của bé Beckham đang ở ngưỡng bình thường"

    }
    
    func setDataCount() {
//        let values = (0..<count).map { (i) -> ChartDataEntry in
//            let val = Double(arc4random_uniform(range) + 3)
//            return ChartDataEntry(x: Double(i), y: val)
//        }
        var values = [ChartDataEntry]()
        let firstSet = ChartDataEntry(x: Double(0), y: type == .weight ? AppModel.shared.weight : AppModel.shared.height)
        values.append(firstSet)
        for info in data {
            let set = GrowthDataEntry(growthInfo: info, type: self.type)
            values.append(set)
        }
        
        let set1 = LineChartDataSet(entries: values, label: "DataSet 1")
        set1.drawIconsEnabled = false
        
        set1.lineDashLengths = [5, 2.5]
        set1.highlightLineDashLengths = [5, 2.5]
        set1.setColor(.black)
        set1.setCircleColor(.black)
        set1.lineWidth = 1
        set1.circleRadius = 3
        set1.drawCircleHoleEnabled = false
        set1.valueFont = .systemFont(ofSize: 9)
        set1.formLineDashLengths = [5, 2.5]
        set1.formLineWidth = 1
        set1.formSize = 15
        
        let gradientColors = [ChartColorTemplates.colorFromString("#00ff0000").cgColor,
                              ChartColorTemplates.colorFromString("#ffff0000").cgColor]
        let gradient = CGGradient(colorsSpace: nil, colors: gradientColors as CFArray, locations: nil)!
        
        set1.fillAlpha = 1
        set1.fill = Fill(linearGradient: gradient, angle: 90) //.linearGradient(gradient, angle: 90)
        set1.drawFilledEnabled = true
        let data = LineChartData(dataSet: set1)
        chartView.data = data
    }


}

extension ChartViewController : ChartViewDelegate {
    func removeNoticeViews(){
        for sub in self.scrollView.subviews {
            if sub.isKind(of: NoticeView.self){
                sub.removeFromSuperview()
            }
        }
        let posY = self.chartView.height + chartView.y + 12
        self.scrollView.posY = posY
    }
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        print(#function)
        print("x : \(entry)")
        removeNoticeViews()
        if let _entry = entry as? GrowthDataEntry {
            for notice in _entry.notices {
                let noticeView = NoticeLayout(notice: notice).arrangement(origin: CGPoint(x: 16, y: 0), width: Size.screen.width - 32).makeViews()
                scrollView.addMoreView(view: noticeView)
                self.scrollView.addBlank(space: 16)
            }
            
        }
    }
}
