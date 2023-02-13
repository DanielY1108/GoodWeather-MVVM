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
}

class WeatherViewModel {
    
    let weather: WeatherResponse
    
    init(weather: WeatherResponse) {
        self.weather = weather
    }
    
    var city: String {
        return self.weather.name
    }
    
    var temperature: Double {
        return self.weather.main.temp
    }
    
    var humidity: Double {
        return self.weather.main.humidity
    }
}
