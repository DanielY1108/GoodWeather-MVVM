//
//  AddWeatherCityViewController.swift
//  GoodWeather
//
//  Created by JINSEOK on 2023/02/09.
//

import UIKit

protocol AddWeatherDelegate: AnyObject {
    func addWeatherDidSave(viewModel: WeatherViewModel)
}

class AddWeatherCityViewController: UIViewController {
    
    private var addWeatherViewModel = AddWeatherViewModel()
    @IBOutlet weak var cityNameTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    weak var delegate: AddWeatherDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cityNameTextField.delegate = self
    }
    
    @IBAction func saveCityButtonPressed(_ sender: UIButton) {
        
        if let city = cityNameTextField.text {
            addWeatherViewModel.addWeather(for: city) { viewModel in
                self.delegate?.addWeatherDidSave(viewModel: viewModel)
                self.dismiss(animated: true)
            }
        }
    }
    
    @IBAction func closeButtonPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
}

extension AddWeatherCityViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        saveCityButtonPressed(saveButton)
        return true
    }
}
