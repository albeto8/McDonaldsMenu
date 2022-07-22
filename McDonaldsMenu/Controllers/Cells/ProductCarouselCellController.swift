//
//  ProductCarouselCellController.swift
//  McDonaldsMenu
//
//  Created by Mario Alberto Barragán Espinosa on 22/07/22.
//

import UIKit

final class ProductCarouselCellController {
    private var cell: ProductCarouselTableViewCell?
    
    private let model: [Product]
    
    init(model: [Product]) {
        self.model =  model
    }
    
    func view(in tableView: UITableView) -> UITableViewCell {
        cell = tableView.dequeueReusableCell()
        cell?.configure(with: model.toViewModels())
        return cell!
    }
}

private extension Array where Element == Product {
    func toViewModels() -> [ProductViewModel<UIImage>] {
        return map { ProductViewModel<UIImage>(model: $0) }
    }
}
