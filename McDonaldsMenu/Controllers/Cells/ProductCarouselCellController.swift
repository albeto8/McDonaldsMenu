//
//  ProductCarouselCellController.swift
//  McDonaldsMenu
//
//  Created by Mario Alberto Barragán Espinosa on 22/07/22.
//

import UIKit

final class ProductCarouselCellController {
    private var cell: ProductCarouselTableViewCell?
    private let imageLoader: ((URL) -> ImageDataLoader.Publisher)?
    
    private let model: [Product]
    
    init(model: [Product], imageLoader: ((URL) -> ImageDataLoader.Publisher)?) {
        self.model =  model
        self.imageLoader = imageLoader
    }
    
    func view(in tableView: UITableView) -> UITableViewCell {
        cell = tableView.dequeueReusableCell()
        cell?.configure(with: model.toViewModels(imageLoader: imageLoader))
        return cell!
    }
}

private extension Array where Element == Product {
    func toViewModels(imageLoader: ((URL) -> ImageDataLoader.Publisher)?) -> [ProductViewModel<UIImage>] {
        return map { ProductViewModel<UIImage>(model: $0, imageLoader: imageLoader, imageTransformer: UIImage.init) }
    }
}
