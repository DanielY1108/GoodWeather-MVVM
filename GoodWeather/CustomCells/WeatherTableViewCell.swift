//
//  WeatherTableViewCell.swift
//  GoodWeather
//
//  Created by JINSEOK on 2023/02/09.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    func configure(viewModel: WeatherViewModel) {
        cityNameLabel.text = viewModel.city
        temperatureLabel.text = viewModel.temperature.formatAsDegree()
    }
}
