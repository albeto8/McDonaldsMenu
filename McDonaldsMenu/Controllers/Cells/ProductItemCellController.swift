//
//  ProductItemCellController.swift
//  McDonaldsMenu
//
//  Created by Mario Alberto Barragán Espinosa on 22/07/22.
//

import UIKit

final class ProductItemCellController {
    private let viewModel: ProductViewModel<UIImage>
    
    init(viewModel: ProductViewModel<UIImage>) {
        self.viewModel = viewModel
    }
    
    func view() -> UICollectionViewCell {
        let cell = binded(ProductCollectionViewCell())
        viewModel.loadImageData()
        return cell
    }
    
    private func binded(_ cell: ProductCollectionViewCell) -> ProductCollectionViewCell {
        cell.productNameLabel.text = viewModel.name
        viewModel.onImageLoad = { image in
            DispatchQueue.main.async {
                cell.productImageView.image = image
            }
        }

        return cell
    }
}
