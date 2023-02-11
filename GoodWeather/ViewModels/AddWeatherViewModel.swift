//
//  AddWeatherViewModel.swift
//  GoodWeather
//
//  Created by JINSEOK on 2023/02/11.
//

import Foundation

class AddWeatherViewModel {
    
    func addWeather(for city: String) {
        
        let weatherURL = Constants.Urls.urlForWeatherByCity(city: city)
        
        let weatherResource = Resource<WeatherResponse>(url: weatherURL) { data in
            let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
            return weatherResponse
        }
        
        Webservice().load(resource: weatherResource) { (result) in
            
            if let weatherResource = result {
                
            }
        }
    }
}
