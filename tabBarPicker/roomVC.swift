//
//  roomVC.swift
//  tabBarPicker
//
//  Created by student on 2/23/24.
//

import UIKit

class roomVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
            case 0: return beds.count
        default: return days.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
            case 0: return beds[row]
        default: return days[row]
        }
    }
    
    @IBOutlet weak var myPicker: UIPickerView!
    var beds: [String] = [String]()
    var days: [String] = [String]()
    
    @IBOutlet weak var myDatePicker: UIDatePicker!
    let dateFormatter: DateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        
        myPicker.delegate = self
        myPicker.dataSource = self
        beds = ["1 King", "2 Twins", "1 Queen"]
        days = ["1 night", "2 nights", "3 nights", "4 nights", "5 nights", "6 nights", "7 nights", "8 nights"]
    }

    @IBAction func datePicker(_ sender: UIDatePicker) {
        let _: String = dateFormatter.string(from: sender.date)
    }
    
    @IBAction func btnTapped(_ sender: UIButton) {
        
        let selectedDate: String = dateFormatter.string(from: myDatePicker.date)
            let bedIndex = myPicker.selectedRow(inComponent: 0)
            let dayIndex = myPicker.selectedRow(inComponent: 1)
            
            let alert = UIAlertController(title: "Your Reservation", message: "Checkin: \(selectedDate)\nBed: \(beds[bedIndex])\nDuration: \(days[dayIndex])", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "OK", style: .default, handler: {action -> Void in})
        
            alert.addAction(okAction)
            
            self.present(alert, animated: true, completion: nil)
    }
}


