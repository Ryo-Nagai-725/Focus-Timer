//
//  ViewController.swift
//  portfolio
//
//  Created by 永井涼 on 2020/12/15.
//

import UIKit
import Charts
import Spring
import Hero


class TimerViewController: UIViewController {
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    var intervals = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        grade()
        cornerRadius()
        TimerManager.shared.timerManagerDelegate = self
    }
    
    @IBAction func tapStartButton(_ sender: Any) {
        startTimer()
        
    }
    @IBAction func tapStopButton(_ sender: Any) {
        stopTimer()
        print(intervals)
    }
    
    func cornerRadius() {
        startButton.layer.cornerRadius = 35.0
        stopButton.layer.cornerRadius = 35.0
    }
    
    
    func grade() {
        //グラデーションの開始色
        let topColor = UIColor(red:1, green:0.38, blue:0.26, alpha:1)
        //グラデーションの開始色
        let bottomColor = UIColor(red:1, green:0.74, blue:0.74, alpha:1)
        let gradientColors: [CGColor] = [topColor.cgColor, bottomColor.cgColor]
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func startTimer() {
        TimerManager.shared.startTimer()
        startButton.isHidden = true
        stopButton.isHidden = false
    }
    
    func stopTimer() {
        TimerManager.shared.stopTimer()
        stopButton.isHidden = true
        intervals.append("\(TimerManager.shared.stopTime)")
    }
    
    func workEndTimer() {
        TimerManager.shared.resetTimer()
    }
    
    func timeString(time: TimeInterval) -> String {
        let hour = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let second = Int(time) % 60
        return String(format: "%02d:%02d:%02d", hour, minutes, second)
    }
}

extension TimerViewController: TimerManagerDelegate {
    func updateTimer(second: Int) {
        timerLabel.text = timeString(time: TimeInterval(second))
    }
    
    
}
