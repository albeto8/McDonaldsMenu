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
        
        sut.loadViewIfNeeded()
        
        assert(sut, device: .iPhoneX)
    }
    
    func test_listWithItems() {
        let sut = MainMenuViewController()
        let beberageCategory = makeMenuCategory(title: "Beverages")
        
        sut.display([beberageCategory])
        
        sut.loadViewIfNeeded()
        
        record(sut, device: .iPhoneX)
    }
    
    private func makeMenuCategory(title: String) -> MenuCategory {
        let product = Product(name: "Coca-Cola")
        return MenuCategory(title: title, products: [product])
    }
}
