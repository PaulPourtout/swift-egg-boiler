//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let cookTimes: [String: Int] = [ "Soft": 5, "Medium": 7, "Hard": 12 ];
    var count: Int = 0
    var currentTimer = Timer()
    
    @IBOutlet weak var appLabel: UILabel!
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        appLabel.text = "Your eggs are boiling..."

        count = cookTimes[hardness]! //* 60
        currentTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateCounter() {
        if (count > 0) {
            print(count)
            count-=1
        } else {
            currentTimer.invalidate()
            appLabel.text = "Done !"
        }
    }
}
