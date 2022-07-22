//
//  ProductCollectionViewCell.swift
//  McDonaldsMenu
//
//  Created by Mario Alberto Barragán Espinosa on 20/07/22.
//

import UIKit

final class ProductCollectionViewCell: UICollectionViewCell {
    static let identifier = "ProductCollectionViewCell"
    
    lazy var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.setDimensions(width: 100, height: 100)
        return imageView
    }()
    
    let productNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Inter-Regular", size: 12)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "Some text"
        label.textColor = .black
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.borderColor = UIColor(named: "itemBorderColor")!.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 5
        
        contentView.addSubview(productImageView)
        contentView.addSubview(productNameLabel)
        
        productImageView.centerX(inView: contentView)
        productImageView.anchor(top: contentView.topAnchor)
        
        productNameLabel.centerX(inView: contentView)
        productNameLabel.anchor(leading: contentView.leadingAnchor, bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor, paddingBottom: 26)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with productViewModel: ProductViewModel<UIImage>) {
        
    }
}
