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
    
    func test_ViewModel_isLoading_shouldBeFalse() throws {
        // Given
        //        guard let vm = viewModel else {
        //            XCTFail()
        //            return
        //        }
        /// There's a way to enhance the testing better.
        let vm = try XCTUnwrap(viewModel)
        
        // Then
        XCTAssertFalse(vm.isLoading, "The view model shouldn't be loading initially.")
    }
    
    
    
    func test_ViewModel_dataModel_shouldBeEmptyInitialy() throws {
        // Given
        //        guard let vm = viewModel else {
        //            XCTFail()
        //            return
        //        }
        let vm = try XCTUnwrap(viewModel)
        // When
        
        // Then
        XCTAssertTrue(vm.dataModel.meals.isEmpty)
    }
    
    func test_LunchScreen_properties_shouldBeFalseAtFirst() throws {
        // Given
        //        guard let lunchScreen = lunchScreen else {
        //            XCTFail()
        //            return
        //        }
        let lunchScreen = try XCTUnwrap(lunchScreen)
        
        // Then
        XCTAssertFalse(lunchScreen.isScaled, "isScaled should be false at First")
        XCTAssertFalse(lunchScreen.showMessage, "showMessage should be false at First")
        XCTAssertFalse(lunchScreen.showNextScreen, "showNextScreen should be false at First")
    }
}
