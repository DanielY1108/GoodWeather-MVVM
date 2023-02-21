//
//  SettingViewModelTests.swift
//  GoodWeatherTests
//
//  Created by JINSEOK on 2023/02/21.
//

import XCTest
@testable import GoodWeather

// SettingViewModel의 온도유닛 관련 테스트
final class SettingViewModelTests: XCTestCase {
    
    private var settingsVM: SettingsViewModel!
    
    override func setUp() {
        super.setUp()
        self.settingsVM = SettingsViewModel()
    }
    
    // 테스트 시 서술형으로 작성하면 정확히 무슨 일이 일어나는지 알 수 있기 때문에 좋다.
    func test_Sholud_return_correct_display_name_for_celsius()  {
        XCTAssertEqual(self.settingsVM.selectedUnit.displayName, "Celsius")
    }
    
    func test_Should_make_sure_that_default_unit_is_celsius() {
        XCTAssertEqual(self.settingsVM.selectedUnit, .celsius)
    }
    
    func test_Should_be_able_to_save_user_unit_selection() {
        self.settingsVM.selectedUnit = .fahrenheit
        let userDefault = UserDefaults.standard
        XCTAssertNotNil(userDefault.value(forKey: "unit"))
    }
    
    override func tearDown() {
        super.tearDown()
        
        let userDefault = UserDefaults.standard
        userDefault.removeObject(forKey: "unit")
    }
    
}
