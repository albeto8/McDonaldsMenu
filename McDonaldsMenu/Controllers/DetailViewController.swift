//
//  DetailViewController.swift
//  McDonaldsMenu
//
//  Created by Mario Alberto Barragán Espinosa on 20/07/22.
//

import UIKit

final class DetailViewController: UIViewController {
    
    private let product: Product
    
    private lazy var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.setDimensions(width: 387, height: 213)
        return imageView
    }()
    
    private let productNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Inter-Regular", size: 12)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "Some text"
        label.textColor = .black
        return label
    }()
    
    init(product: Product) {
        self.product = product
        super.init(nibName: String(describing: DetailViewController.self), bundle: Bundle(for: type(of: self)))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(productImageView)
        view.addSubview(productNameLabel)
    }
}
