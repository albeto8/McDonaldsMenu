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
        let product = Product(name: "Coca-Cola", 
                              imageName: "cocaCola")
        let sut = DetailViewController(product: product)
        
        sut.loadViewIfNeeded()
        
        record(sut, device: .iPhoneX)
    }
}
