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
        label.font = UIFont(name: "Inter-Bold", size: 24)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    private let priceContainerView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 15
        view.setDimensions(width: 78, height: 30)
        return view
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Inter-Regular", size: 16)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .black
        label.text = "$10"
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Inter-Regular", size: 16)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .black
        label.text = "The McDonald's Bacon, Egg & Cheese Biscuit breakfast sandwich features a warm, buttermilk biscuit brushed with real butter, thick cut Applewood smoked bacon, a fluffy folded egg, and a slice of melty American cheese. There are 460 calories in a Bacon, Egg & Cheese Biscuit at McDonald's. Try one today with a Premium Roast Coffee and order with Mobile Order & Pay on the McDonald's App!"
        return label
    }()
    
    init(product: Product) {
        self.product = product
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(productImageView)
        view.addSubview(productNameLabel)
        view.addSubview(priceContainerView)
        priceContainerView.addSubview(priceLabel)
        view.addSubview(descriptionLabel)
        
        productImageView.centerX(inView: view)
        productImageView.anchor(top: view.topAnchor, paddingTop: 51)
        
        productNameLabel.anchor(top: productImageView.bottomAnchor, paddingTop: 48)
        productNameLabel.centerX(inView: view)
        productNameLabel.setWidth(width: 180)
        
        priceContainerView.centerX(inView: view)
        priceContainerView.anchor(top: productNameLabel.bottomAnchor, paddingTop: 28)
        priceLabel.center(inView: priceContainerView)
        
        descriptionLabel.anchor(top: priceContainerView.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, paddingTop: 21, paddingLeading: 30, paddingTrailing: 30)
        
        configure(with: product)
    }
    
    private func configure(with product: Product) {
        productImageView.image = UIImage(named: product.imageName)
        productNameLabel.text = product.name
    }
}
