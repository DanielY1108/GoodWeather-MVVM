//
//  Double+Extension.swift
//  GoodWeather
//
//  Created by JINSEOK on 2023/02/13.
//

import Foundation

extension Double {
    
    func formatAsDegree() -> String {
        return String(format: "%.0f°", self)
    }
}
