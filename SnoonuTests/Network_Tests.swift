//
//  Network_Tests.swift
//  SnoonuTests
//
//  Created by Ahmed Fathi on 08/10/2024.
//

import XCTest
@testable import Snoonu
import Combine

final class Network_Tests: XCTestCase {
    
    var viewModel: ViewModel?
    var cancelabels = Set<AnyCancellable>()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = ViewModel(apiManager: NetworkManager(session: URLSession.shared), dataModel: Resturant(meals: []))
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
    }

    func test_viewModel_fetchData_shouldReturnData(){
        // Given
        guard let vm = viewModel else { return }
        
        // When
        let excpectation = XCTestExpectation(description: "Should return data after 3 Seconds.")
        
        vm.$dataModel
        /// i set dropFirst here to ignore the the default value and return the rest of data.
            .dropFirst()
            .sink(receiveValue: { returnItem in
                excpectation.fulfill()
            })
            .store(in: &cancelabels)
        
        vm.fetchData()
        
        wait(for: [excpectation], timeout: 3)
        XCTAssertGreaterThan(vm.dataModel.meals.count, 0)
    }
}
