//
//  WeatherListViewModel.swift
//  GoodWeather
//
//  Created by JINSEOK on 2023/02/11.
//

import Foundation

struct WeatherListViewModel {
    
    private(set) var weatherViewModels = [WeatherViewModel]()
    
    mutating func addWeatherViewModel(_ viewModel: WeatherViewModel) {
        self.weatherViewModels.append(viewModel)
    }
    
    func numberOfRaws(_ section: Int) -> Int {
        return self.weatherViewModels.count
    }
    
    func modelAt(_ index: Int) -> WeatherViewModel {
        return self.weatherViewModels[index]
    }
    
    private mutating func toCelsius() {
        
        self.weatherViewModels = weatherViewModels.map { viewModel in
            let weatherModel = viewModel
            // ℃ = (℉ − 32) × 5/9 화씨 -> 도씨
            weatherModel.temperature = (weatherModel.temperature - 32) * 5 / 9
            return weatherModel
        }
    }
    
    private mutating func toFahrenheit() {
        self.weatherViewModels = weatherViewModels.map { viewModel in
            let weatherModel = viewModel
            // (0°C × 9/5) + 32 = 32°F 공식 도씨 -> 화씨
            weatherModel.temperature = (weatherModel.temperature * 9 / 5) + 32
            return weatherModel
        }
    }
    
    mutating func updateUnit(to unit: Unit) {
        switch unit {
        case .celsius:
            self.toCelsius()
        case .fahrenheit:
            self.toFahrenheit()
        }
    }
}

class WeatherViewModel {
    
    let weather: WeatherResponse
    var temperature: Double
    
    init(weather: WeatherResponse) {
        self.weather = weather
        self.temperature = weather.main.temp
    }
    
    var city: String {
        return self.weather.name
    }
}
