//
//  WeatherListViewModelTests.swift
//  GoodWeatherTests
//
//  Created by JINSEOK on 2023/02/21.
//

import XCTest
@testable import GoodWeather

final class WeatherListViewModelTests: XCTestCase {
    
    private var weatherListVM: WeatherListViewModel!
    
    override func setUp() {
        super.setUp()
        
        self.weatherListVM = WeatherListViewModel()
        
        self.weatherListVM.addWeatherViewModel(WeatherViewModel(weather: WeatherResponse(name: "seoul", main: Weather(temp: 20, humidity: 0))))
        
        self.weatherListVM.addWeatherViewModel(WeatherViewModel(weather: WeatherResponse(name: "busan", main: Weather(temp: 30, humidity: 0))))
    }
    
    
    func test_Should_be_able_to_convert_to_fahrenheit_successfully() {
        
        let fahrenheitTemperature = [68.0, 86.0]
        self.weatherListVM.updateUnit(to: .fahrenheit)
        
        for (index, vm) in self.weatherListVM.weatherViewModels.enumerated() {
            XCTAssertEqual(vm.temperature, fahrenheitTemperature[index])
        }
    }
    
    
    override func tearDown() {
        super.tearDown()
        
    }
    
}
