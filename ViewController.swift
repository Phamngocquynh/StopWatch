//
//  ViewController.swift
//  StopWatch
//
//  Created by Pham ngoc Quynh on 1/12/16.
//  Copyright © 2016 Pham ngoc Quynh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timeLabel: UILabel!
    
    var startTimer : NSDate?
    var stopTimer : NSDate?
    var currentTimer : NSDate?
    var duration : NSTimeInterval?
    var timer : NSTimer?
    var stopDuration : NSTimeInterval = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func start(){
        if timer == nil { //Start Timer
            timer = NSTimer()
            timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: "updateTimer", userInfo: nil, repeats: true)
            startTimer = NSDate()
            
            if stopTimer != nil {//Calculate the duration eslapse from start to the stop, subtract  from new start
                
            }
            else { //new start time
                
            }
        }
        else {
            //Don't start Timer
        }
    }
    
    func updateTimer(){
        currentTimer = NSDate()
        if startTimer != nil {
            duration = (currentTimer?.timeIntervalSinceDate(startTimer!))! + stopDuration
            timeLabel.text = dateStringFromTimeInterval(duration!)
        }
    }
    
    func stop(){
        if duration != nil {
            stopDuration = duration!
        }
        timer?.invalidate()
        timer = nil
    }
    
    func reset(){
        timer?.invalidate()
        timer = nil
        startTimer = nil
        currentTimer = nil
        stopDuration = 0
        timeLabel.text = dateStringFromTimeInterval(0)
    }
    
    func dateStringFromTimeInterval(timeInterval : NSTimeInterval) -> String{
        var formater = NSDateFormatter()
        formater.dateFormat = "HH:mm:ss.SS"
        formater.timeZone = NSTimeZone(name: "GMT")
        
        var date = NSDate(timeIntervalSince1970: timeInterval)
        
        return formater.stringFromDate(date)
    }
 
    @IBAction func stopButtonPressed(sender: AnyObject) {
        stop()
    }

    @IBAction func startButtonPressed(sender: AnyObject) {
        start()
    }

    @IBAction func resetButtonPressed(sender: AnyObject) {
        reset()
    }
}
