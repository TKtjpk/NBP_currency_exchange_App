//
//  NASKTests.swift
//  NASKTests
//
//  Created by Tomasz Kubicki on 28/08/2023.
//

import XCTest
@testable import NASK

final class DataReceivingDecodingTests: XCTestCase {
    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {}

    func test_DataService_receivedDataIsNotNil() throws {
        // Given
        let dataService = DataService()
        
        // When
        let table = dataService.mockedData()
        
        // Then
        XCTAssertNotNil(table, "Basic Data Table JSON decoding failed")
    }
    
    func test_DailyService_receivedDataIsNotNil() throws {
        // Given
        let dataService = DataService()
        let dailyService = DailyService()
        let codes = ["chf", "usd", "thb", "aud"]
        
        for rate in codes {
            
            // When
            let daily = dailyService.mockedData(currency: (rate.lowercased()))
            
            // Then
            XCTAssertNotNil(daily.table, "Daily Rates Data JSON decaoding failed")
        }
    }
    
    func test_DailyService_receivedDataIsNil() throws {
        // Given
        let dataService = DataService()
        let dailyService = DailyService()
        
        // When
        let daily = dailyService.mockedData(currency: "CHG")
        
        // Then
        XCTAssertNil(daily.table, "Daily Rates Data JSON decaoding failed")
    }
    
    func test_Application_expectedError() throws {
        XCTExpectFailure("Working on a fix for this problem.")
    }
    
//    func testPerformanceExample() throws {
//        self.measure {
//            // Given
//            let networkModel = NetworkContentModel()
//
//            // Then
//            XCTAssertTrue(networkModel.netData.count == 0, "")
//        }
//    }
}
