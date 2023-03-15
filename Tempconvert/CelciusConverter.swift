//
//  CelciusConverter.swift
//  Tempconvert
//
//  Created by Edgar Backer on 2023-03-14.
//

import Foundation

class CelsiusConverter{
    
    func degreesFahrenheit(degreesCelsius: Int) -> Int {
        
        let tempF = 1.8 * Double(degreesCelsius) + 32
        
        return Int(round(tempF))
    }
}
