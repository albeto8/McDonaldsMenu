//
//  McDonaldsMenuTests.swift
//  McDonaldsMenuTests
//
//  Created by Mario Alberto Barragán Espinosa on 20/07/22.
//

import XCTest
@testable import McDonaldsMenu

class McDonaldsMenuTests: XCTestCase {
    func test_emptyScreen() {
        let sut = MainMenuViewController()
        
        assert(sut, device: .iPhoneX)
    }
}
