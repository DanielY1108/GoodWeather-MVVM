//
//  WeatherResponse.swift
//  GoodWeather
//
//  Created by JINSEOK on 2023/02/11.
//

import Foundation

struct WeatherResponse: Codable {
    let name: String
    let main: Weather
}

struct Weather: Codable {
    let temp: Double
    let humidity: Double
}
