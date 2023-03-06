//
//  PresentationViewModelTests.swift
//  MACalculatorAppTests
//
//  Created by Alam, Mahjabin | Natasha | ECMPD on 2023/03/06.
//

import XCTest
@testable import MACalculatorApp

class PresentationViewModelTests: XCTestCase {

    var sut: PresentationViewModel!
    
    override func setUp() {
        super.setUp()
        sut = PresentationViewModel()
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testEntireDataSourceCount() {
        XCTAssertEqual(sut.entireDataSource.count, 20)
    }


}
