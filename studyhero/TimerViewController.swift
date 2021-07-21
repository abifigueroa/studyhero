//
//  TimerViewController.swift
//  studyhero
//
//  Created by  Scholar on 7/21/21.
//

import UIKit

class TimerViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var resetButton: UIButton!
    
    var timer:Timer = Timer()
    var count:Int = 0
    var timerCounting:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.setTitleColor(UIColor.green, for:.normal)

    }
    

    @IBAction func startStopTapped(_ sender: Any) {
        
        if (timerCounting){
            timerCounting = false
            timer.invalidate()
            startButton.setTitle("Start", for: .normal)
        } else {
            timerCounting = true
            startButton.setTitle("Stop", for: .normal)
            startButton.setTitleColor(UIColor.red, for:.normal)
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
        }
    }
    
    @objc func timerCounter() -> Void{
        count = count+1
        let time = secondsToHoursMinutesSeconds(seconds: count)
        let timeString = makeTimeString(hours: time.0, minutes: time.1, seconds: time.2)
        timerLabel.text = timeString
    }
    
    
    func secondsToHoursMinutesSeconds(seconds: Int)-> (Int,Int,Int){
        return ((seconds / 3600), ((seconds % 3600)/60),((seconds % 3600) % 60))
    }
    
    func makeTimeString(hours: Int, minutes: Int, seconds: Int) -> String{
        var timeString = ""
        timeString += String(format:"%02d",hours)
        timeString += ":"
        timeString += String(format:"%02d",minutes)
        timeString += ":"
        timeString +=  String(format:"%02d",seconds)
        return timeString
    }
    
    @IBAction func resetTapped(_ sender: Any) {
        let alert = UIAlertController(title: "Reset Timer?", message: "Are you sure you would like to reset the timer?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel",style: .cancel, handler: { (_) in }))
        alert.addAction(UIAlertAction(title: "Yes",style: .default, handler: { (_) in
            self.count = 0
            self.timer.invalidate()
            self.timerLabel.text = self.makeTimeString(hours: 0, minutes: 0, seconds: 0)
        self.startButton.setTitle("Start", for: .normal)
        self.startButton.setTitleColor(UIColor.green, for:.normal)
            
        }))
        self.present(alert, animated: true, completion:nil)
    }
    
}
