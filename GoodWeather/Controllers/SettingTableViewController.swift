//
//  SettingTableViewController.swift
//  GoodWeather
//
//  Created by JINSEOK on 2023/02/13.
//

import UIKit

protocol SettingsDelegate: AnyObject {
    func settingsDone(_ viewController: SettingTableViewController, viewModel: SettingsViewModel)
}

class SettingTableViewController: UITableViewController {
    
    private var settingViewModel = SettingsViewModel()
    
    weak var delegate: SettingsDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        if let delegate = delegate {
            delegate.settingsDone(self, viewModel: settingViewModel)
        }
        self.dismiss(animated: true)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingViewModel.units.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let settingItem = settingViewModel.units[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingCell", for: indexPath)
        cell.textLabel?.text = settingItem.displayName
        
        if settingItem == settingViewModel.selectedUnit {
            cell.accessoryType = .checkmark
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        // 처음에 모든 체트 해제
        tableView.visibleCells.forEach { cell in
            cell.accessoryType = .none
        }
        
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .checkmark
            let unit = Unit.allCases[indexPath.row]
            settingViewModel.selectedUnit = unit
        }
    }
}

