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
    private let selection: ((ProductViewModel<UIImage>) -> Void)?
    
    private let model: [Product]
    
    init(model: [Product], 
         imageLoader: ((URL) -> ImageDataLoader.Publisher)?, 
         selection: ((ProductViewModel<UIImage>) -> Void)? = nil) {
        self.model =  model
        self.imageLoader = imageLoader
        self.selection = selection
    }
    
    func view(in tableView: UITableView) -> UITableViewCell {
        cell = tableView.dequeueReusableCell()
        cell?.configure(with: model.toCellControllers(imageLoader: imageLoader, 
                                                      selection: selection))
        return cell!
    }
}

private extension Array where Element == Product {
    func toCellControllers(imageLoader: ((URL) -> ImageDataLoader.Publisher)?,
                           selection: ((ProductViewModel<UIImage>) -> Void)?) -> [ProductItemCellController] {
        return map { product in
            let viewModel = ProductViewModel<UIImage>(model: product, 
                                                      imageLoader: imageLoader, 
                                                      imageTransformer: UIImage.init)
            return ProductItemCellController(viewModel: viewModel, selection: {
                selection?(viewModel)
            })
        }
    }
}
