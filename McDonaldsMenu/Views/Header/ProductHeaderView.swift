//
//  ProductHeaderView.swift
//  McDonaldsMenu
//
//  Created by Mario Alberto Barragán Espinosa on 20/07/22.
//

import UIKit

final class ProductHeaderView: UITableViewHeaderFooterView {
    static let identifier = "ProductHeaderView"
    
    private let sectionTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 36, weight: .semibold)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.addSubview(sectionTitleLabel)
        sectionTitleLabel.anchor(leading: contentView.leadingAnchor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with sectionTitle: String) {
        sectionTitleLabel.text = sectionTitle
    }
}
