//
//  DetailViewControllerSnapshotTests.swift
//  McDonaldsMenuTests
//
//  Created by Mario Alberto Barragán Espinosa on 20/07/22.
//

@testable import McDonaldsMenu
import XCTest

final class DetailViewControllerSnapshotTests: XCTestCase {
    func test_detailView() {
        let product = Product(name: "Bacon, Egg & Cheese Biscuit", 
                              imageName: "cocaCola", productDescription: "The McDonald's Bacon, Egg & Cheese Biscuit breakfast sandwich features a warm, buttermilk biscuit brushed with real butter, thick cut Applewood smoked bacon, a fluffy folded egg, and a slice of melty American cheese. There are 460 calories in a Bacon, Egg & Cheese Biscuit at McDonald's. Try one today with a Premium Roast Coffee and order with Mobile Order & Pay on the McDonald's App!", price: 10)
        let sut = DetailViewController(product: product)
        
        sut.loadViewIfNeeded()
        
        record(sut, device: .iPhoneX)
    }
}
