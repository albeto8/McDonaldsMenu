//
//  ProductItemCellController.swift
//  McDonaldsMenu
//
//  Created by Mario Alberto Barragán Espinosa on 22/07/22.
//

import UIKit

final class ProductItemCellController {
    private let viewModel: ProductViewModel<UIImage>
    private let selection: () -> Void
    
    init(viewModel: ProductViewModel<UIImage>, selection: @escaping () -> Void) {
        self.viewModel = viewModel
        self.selection = selection
    }
    
    func view(in collectionView: UICollectionView, for indexPath: IndexPath) -> UICollectionViewCell {
        let cell = binded(collectionView.dequeueReusableCell(for: indexPath))
        viewModel.loadImageData()
        return cell
    }
    
    func didTap() {
        selection()
    }
    
    private func binded(_ cell: ProductCollectionViewCell) -> ProductCollectionViewCell {
        cell.productNameLabel.text = viewModel.name
        viewModel.onImageLoad = { image in
            cell.productImageView.image = image
        }

        return cell
    }
}

extension UICollectionView {
    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        let identifier = String(describing: T.self)
        return dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! T
    }
}
