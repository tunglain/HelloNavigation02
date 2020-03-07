//
//  Page2ViewController.swift
//  HelloNavigation02
//
//  Created by 棟樑許 on 2020/3/7.
//  Copyright © 2020 棟樑許. All rights reserved.
//

import UIKit

class Page2ViewController: UIViewController {
    @IBOutlet weak var dataLabel: UILabel!
    
    @IBOutlet weak var theDatePicker: UIDatePicker!
    
    @IBOutlet weak var dateButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        theDatePicker.isHidden = true
        let userDefult = UserDefaults.standard
        let lastDate = userDefult.value(forKey: "lastInputDate")
        if let date = lastDate as? Date{
            disPlayDate(date: date)
        }else{
            dataLabel.text = "沒有輸入過"
        }
        //self.view.backgroundColor = UIColor.red
    }
    

    @IBAction func dateSeleted(_ sender: UIDatePicker) {
        print("test")
        let date = sender.date
        print("\(date)")
        disPlayDate(date: date)
        saveDate(date: date)
        theDatePicker.isHidden = true
        dateButton.isHidden = false
    }
    
    func saveDate(date : Date){
        let userDefult = UserDefaults.standard
        userDefult.set(date,forKey: "lastInputDate")
        userDefult.synchronize()
    }
    
    func disPlayDate(date : Date){
        let formater = DateFormatter()
        formater.timeZone = .current
        formater.dateFormat = "yyyy-MM-dd HH:mm"
//        formater.locale = Locale(identifier: "zh_Hant_TW")
        //print(UIDevice.current.localizedModel)
        let dateString = formater.string(from: date)
        dataLabel.text = dateString
    }

    
    @IBAction func showDatePicker(_ sender: UIButton) {
        dateButton.isHidden = true
        theDatePicker.isHidden = false
    }
    
}
