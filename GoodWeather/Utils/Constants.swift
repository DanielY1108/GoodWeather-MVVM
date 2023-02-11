//
//  Constants.swift
//  GoodWeather
//
//  Created by JINSEOK on 2023/02/11.
//

import Foundation

struct Constants {
    
    struct Urls {
        
        static func urlForWeatherByCity(city: String) -> URL {
            
            return URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city.escape)&appid=\(Bundle.main.apiKey)&units=metric")!
        }
    }
}
