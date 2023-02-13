//
//  SettingsViewModel.swift
//  GoodWeather
//
//  Created by JINSEOK on 2023/02/13.
//

import Foundation

enum Unit: String, CaseIterable {
    case celsius = "metric"
    case fahrenheit = "imperial"
}

extension Unit {
    
    var displayName: String {
        switch self {
        case .celsius:
            return "Celsius"
        case .fahrenheit:
            return "Fahrenheit"
        }
    }
}

class SettingsViewModel {
    // enum을 모든 case를 배열로 만듬
    let units = Unit.allCases
    
    var selectedUnit: Unit {
        get {
            let userDefault = UserDefaults.standard
            var unitValue = ""
            if let value = userDefault.value(forKey: "unit") as? String {
                unitValue = value
            }
            return Unit(rawValue: unitValue)!
        }
        set {
            let userDefault = UserDefaults.standard
            userDefault.set(newValue.rawValue, forKey: "unit")
        }
    }
}
