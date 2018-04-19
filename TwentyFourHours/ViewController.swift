//
//  ViewController.swift
//  TwentyFourHours
//
//  Created by Simon Bromberg on 2018-04-19.
//  Copyright © 2018 Dash MD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var twentyFourHourLabel: UILabel!
    @IBOutlet var twelveHourLabel: UILabel!
    @IBOutlet var timeStyleLabel: UILabel!
    @IBOutlet var dateStyleLabel: UILabel!
    @IBOutlet var localeLabel: UILabel!
    @IBOutlet var isTwentyFourHourTimeLabel: UILabel!
    
    let twentyFourHourDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter
    }()
    
    let twelveHourDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        return formatter
    }()
    
    let timeStyleDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        return formatter
    }()
    
    let dateStyleDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()
    
    
    var isTwentyFourHourTime: Bool {
        let formatString = DateFormatter.dateFormat(fromTemplate: "j", options: 0, locale: Locale.current)!
        return !formatString.contains("a")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(reload), name: .UIApplicationDidBecomeActive, object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        reload()
    }
    
    @objc func reload() {
        localeLabel.text = Locale.current.identifier
        let date = Date()
        twelveHourLabel.text = twelveHourDateFormatter.string(from: date)
        twentyFourHourLabel.text = twentyFourHourDateFormatter.string(from: date)
        
        isTwentyFourHourTimeLabel.text = isTwentyFourHourTime ? "24 hour time ON" : "24 hour time OFF"
        
        timeStyleLabel.text = timeStyleDateFormatter.string(from: date)
        dateStyleLabel.text = dateStyleDateFormatter.string(from: date)
    }
}
