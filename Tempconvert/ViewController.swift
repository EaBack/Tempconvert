//
//  ViewController.swift
//  Tempconvert
//
//  Created by Edgar Backer on 2023-03-14.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
 
    
    @IBOutlet weak var temperatureLabel: UILabel!
     
    @IBOutlet weak var celsiusPickerView: UIPickerView!
    
    let usersDefaultRowKey = "defaultsRowKey"
     
    var tempValues = (-100...100).reversed().map{$0}
    let converter = CelsiusConverter()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     /*
        for index in -100...100{
            tempValues.append(index)
        }//of doe het zoals boven gedaan is met .map in 1 keer
      */
        let defaultRow = initialPickerRow()
        celsiusPickerView.selectRow(defaultRow, inComponent: 0, animated: true)
        pickerView(celsiusPickerView, didSelectRow: defaultRow , inComponent: 0 )
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return tempValues.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
         return "\(tempValues[row]) °C"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //print("\(row) : \(tempValues[row])")
        let tempC = tempValues[row]
        let tempF = converter.degreesFahrenheit(degreesCelsius: tempC)
        
        temperatureLabel.text = "\(tempF) ºF"
        saveSelected(row: row )
    }
    
    func saveSelected(row: Int) {
        let defaults = UserDefaults.standard
        
        defaults.set(row, forKey: usersDefaultRowKey)
        defaults.synchronize()
    }
    
    func initialPickerRow() -> Int{
        
        let savedRow = UserDefaults.standard.object(forKey: usersDefaultRowKey) as? Int
        
        if let row = savedRow{
            return row
        }else {
            return tempValues.count / 2
        }
    }

}

