//
//  WeatherListTableViewController.swift
//  GoodWeather
//
//  Created by JINSEOK on 2023/02/09.
//

import UIKit

class WeatherListTableViewController: UITableViewController {
    
    private var weatherListViewModel = WeatherListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    // 데이터 전달을 위해 제약조건을 만들어 줌
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 만약 segue의 indnetifier가 일치하면
        // 가르키는 segue가 네이게이션 컨트롤러이면서 그 안의 첫번째 컨드롤러가 AddWeatherCityViewController일 때
        // 대리자는 현재 이 컨트롤러가 된다!
        if segue.identifier == "AddWeatherCityViewController" {
            prepareSegueForAddWeatherCityViewController(segue: segue)
        }
    }
    
    private func prepareSegueForAddWeatherCityViewController(segue: UIStoryboardSegue) {
        // 네비게이션의 위치
        guard let nav = segue.destination as? UINavigationController else {
            fatalError("NavigationController not found")
        }
        // AddWeatherCityViewController
        guard let addWeatherCityVC = nav.viewControllers.first as? AddWeatherCityViewController else {
            fatalError("AddWeatherCityController not found")
        }
        // 대리자를 뷰켠으로 지정
        addWeatherCityVC.delegate = self
    }
    
}

extension WeatherListTableViewController: AddWeatherDelegate {
    
    func addWeatherDidSave(viewModel: WeatherViewModel) {
        weatherListViewModel.addWeatherViewModel(viewModel)
        self.tableView.reloadData()
    }
    
    
}

extension WeatherListTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherListViewModel.numberOfRaws(section)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherTableViewCell
        
        let weatherViewModel = weatherListViewModel.modelAt(indexPath.row)
        cell.configure(viewModel: weatherViewModel)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

