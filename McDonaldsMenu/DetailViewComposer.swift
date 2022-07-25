//
//  DetailViewComposer.swift
//  McDonaldsMenu
//
//  Created by Mario Alberto Barragán Espinosa on 25/07/22.
//

import UIKit
import Combine

final class DetailViewComposer {
    private init() {}
    
    static func build(for viewModel: ProductViewModel<UIImage>) -> DetailViewController {
        let detailController = DetailViewController(productViewModel: viewModel)
        detailController.modalPresentationStyle = .pageSheet
        return detailController
    }
}
