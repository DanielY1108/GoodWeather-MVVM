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
            
            // 온도 단위 변환 후 도시를 추가하면 화씨 도씨로 변화하지 않고 무조건 고정값을 갖음
            // 저장된 단위를 사용해 url로 호출 하기
            let userDefault = UserDefaults.standard
            let unit = userDefault.value(forKey: "unit") as? String ?? "metric"
            
            return URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city.escape)&appid=\(Bundle.main.apiKey)&units=\(unit)")!
        }
    }
}
