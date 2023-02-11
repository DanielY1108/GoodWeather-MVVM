//
//  AddWeatherCityViewController.swift
//  GoodWeather
//
//  Created by JINSEOK on 2023/02/09.
//

import UIKit

class AddWeatherCityViewController: UIViewController {
    
    @IBOutlet weak var cityNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func saveCityButtonPressed(_ sender: UIButton) {
        
        if let city = cityNameTextField.text {
            
            let weatherURL = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(Bundle.main.apiKey)")!
            
            let weatherReource = Resource<Any>(url: weatherURL) { data in
                return data
            }
            
            Webservice().load(resource: weatherReource) { result in
                
            }
        }
        
    }
    
    @IBAction func closeButtonPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
    
}
