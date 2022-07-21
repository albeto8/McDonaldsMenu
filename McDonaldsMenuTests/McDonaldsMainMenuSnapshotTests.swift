//
//  McDonaldsMainMenuSnapshotTests.swift
//  McDonaldsMenuTests
//
//  Created by Mario Alberto Barragán Espinosa on 20/07/22.
//

import XCTest
@testable import McDonaldsMenu

class McDonaldsMainMenuSnapshotTests: XCTestCase {
    func test_emptyScreen() {
        let sut = MainMenuViewController()
        
        sut.loadViewIfNeeded()
        
        assert(sut, device: .iPhoneX)
    }
    
    func test_listWithItems() {
        let sut = MainMenuViewController()
        let beberageCategory = makeMenuCategory(title: "Beverages")
        
        sut.display([beberageCategory, beberageCategory])
        
        sut.loadViewIfNeeded()
        
        assert(sut, device: .iPhoneX)
    }
    
    private func makeMenuCategory(title: String) -> MenuCategory {
        let product = Product(name: "Coca-Cola", imageName: "cocaCola")
        let product2 = Product(name: "Sprite", imageName: "cocaCola")
        let product3 = Product(name: "Fanta", imageName: "cocaCola")
        return MenuCategory(title: title, products: [product, product2, product3])
    }
}
