//
//  ProductViewModel.swift
//  McDonaldsMenu
//
//  Created by Mario Alberto Barragán Espinosa on 22/07/22.
//

import Foundation
import Combine

final class ProductViewModel<Image> {
    typealias Observer<T> = (T) -> Void
    
    private let model: Product
    private let imageLoader: ((URL) -> ImageDataLoader.Publisher)?
    private let imageTransformer: (Data) -> Image?
    
    private var cancellable: Cancellable?
    
    var onImageLoadingStateChange: Observer<Bool>?
    var onImageLoad: Observer<Image>?
    
    init(model: Product,
         imageLoader: ((URL) -> ImageDataLoader.Publisher)? = nil, 
         imageTransformer: @escaping (Data) -> Image?) {
        self.model = model
        self.imageLoader = imageLoader
        self.imageTransformer = imageTransformer
    }
    
    var name: String {
        model.name
    }
    
    var price: String {
        "$\(model.price.clean)"
    }
    
    var productDescription: String {
        model.productDescription
    }
    
    func loadImageData() {
        guard let imageURL = URL(string: model.imagePath) else {
            //TODO Handle sad path for invalid URL
            return
        }
        
        onImageLoadingStateChange?(true)
        
        cancellable = imageLoader?(imageURL)
            .dispatchOnMainQueue()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure:
                    //TODO Handle sad path for invalid image
                    print("Network failure!!!")
                    
                case .finished: break
                }
            }, receiveValue: { [weak self] imageData in
                if let image = self?.imageTransformer(imageData) {
                    self?.onImageLoad?(image)
                } else {
                    //TODO Handle sad path for invalid image
                }
            })
    }
}
