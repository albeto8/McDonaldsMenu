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
        
        record(sut, device: .iPhoneX)
    }
    
    private func makeMenuCategory(title: String) -> MenuCategory {
        let product = Product(name: "6 Piece Chicken McNuggets® Happy Meal", imageName: "cocaCola", productDescription: makeProductDescription(), price: 10)
        let product2 = Product(name: "Sprite", imageName: "cocaCola", productDescription: makeProductDescription(), price: 10)
        let product3 = Product(name: "Fanta", imageName: "cocaCola", productDescription: makeProductDescription(), price: 10)
        return MenuCategory(title: title, products: [product, product2, product3])
    }
    
    
    private func makeProductDescription() -> String {
        "The McDonald's Bacon, Egg & Cheese Biscuit breakfast sandwich features a warm, buttermilk biscuit brushed with real butter, thick cut Applewood smoked bacon, a fluffy folded egg, and a slice of melty American cheese. There are 460 calories in a Bacon, Egg & Cheese Biscuit at McDonald's. Try one today with a Premium Roast Coffee and order with Mobile Order & Pay on the McDonald's App!"
    }
}
