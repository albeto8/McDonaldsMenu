//
//  ProductCollectionViewCell.swift
//  McDonaldsMenu
//
//  Created by Mario Alberto Barragán Espinosa on 20/07/22.
//

import UIKit

final class ProductCollectionViewCell: UICollectionViewCell {
    static let identifier = "ProductCollectionViewCell"
    
    private lazy var productImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.setDimensions(width: 100, height: 100)
        return iv
    }()
    
    private let productNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "Some text"
        label.textColor = .black
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 0.5
        
        contentView.addSubview(productImageView)
        contentView.addSubview(productNameLabel)
        
        productImageView.centerX(inView: contentView)
        productImageView.anchor(top: contentView.topAnchor)
        
        productNameLabel.centerX(inView: contentView)
        productNameLabel.anchor(bottom: contentView.bottomAnchor, paddingBottom: 26)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with productName: String) {
        productNameLabel.text = productName
        productImageView.image = UIImage(named: "cocaCola")
    }
}
