//
//  WeatherListViewModel.swift
//  GoodWeather
//
//  Created by JINSEOK on 2023/02/11.
//

import Foundation

class WeatherListViewModel {
    
    private var weatherViewModel = [WeatherViewModel]()
    
    func addWeatherViewModel(_ viewModel: WeatherViewModel) {
        weatherViewModel.append(viewModel)
    }
    
    func numberOfRaws(_ section: Int) -> Int {
        return weatherViewModel.count
    }
    
    func modelAt(_ index: Int) -> WeatherViewModel {
        return weatherViewModel[index]
    }
    
    private func toCelsius() {
        
        weatherViewModel = weatherViewModel.map { viewModel in
            let weatherModel = viewModel
            // ℃ = (℉ − 32) × 5/9 화씨 -> 도씨
            weatherModel.temperature = (weatherModel.temperature - 32) * 5 / 9
            return weatherModel
        }
    }
    
    private func toFahrenheit() {
        weatherViewModel = weatherViewModel.map { viewModel in
            let weatherModel = viewModel
            // (0°C × 9/5) + 32 = 32°F 공식 도씨 -> 화씨
            weatherModel.temperature = (weatherModel.temperature * 9 / 5) + 32
            return weatherModel
        }
    }
    
    func updateUnit(to unit: Unit) {
        switch unit {
        case .celsius:
            toCelsius()
        case .fahrenheit:
            toFahrenheit()
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
