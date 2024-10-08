//
//  SnoonuTests.swift
//  SnoonuTests
//
//  Created by Ahmed Fathi on 08/10/2024.
//

import XCTest
@testable import Snoonu

final class SnoonuTests: XCTestCase {

    var viewModel: ViewModel?
    var lunchScreen: LunchScreen?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = ViewModel(dataModel: Resturant(meals: []))
        lunchScreen = LunchScreen()
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
        lunchScreen = nil
    }
    
    func test_ViewModel_isLoading_shouldBeFalse() {
        // Given
        guard let vm = viewModel else {
            XCTFail()
            return
        }
        // When
        
        // Then
        XCTAssertFalse(vm.isLoading)
    }
    
    func test_ViewModel_dataModel_shouldBeNilAtFirst() {
        // Given
        guard let vm = viewModel else {
            XCTFail()
            return
        }
        // When
        
        // Then
        XCTAssertTrue(vm.dataModel.meals.isEmpty)
    }
    
    func test_LunchScreen_properties_shouldBeFalseAtFirst() {
        // Given
        guard let lunchScreen = lunchScreen else {
            XCTFail()
            return
        }
        // When
        
        // Then
        XCTAssertFalse(lunchScreen.isScaled)
        XCTAssertFalse(lunchScreen.showMessage)
        XCTAssertFalse(lunchScreen.showNextScreen)
    }
    
}
