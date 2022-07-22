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
    private let imageLoader: (URL) -> ImageDataLoader.Publisher
    private let imageTransformer: (Data) -> Image?
    
    private var cancellable: Cancellable?
    
    var onImageLoadingStateChange: Observer<Bool>?
    var onImageLoad: Observer<Image>?
    
    init(model: Product,
         imageLoader: @escaping (URL) -> ImageDataLoader.Publisher, 
         imageTransformer: @escaping (Data) -> Image?) {
        self.model = model
        self.imageLoader = imageLoader
        self.imageTransformer = imageTransformer
    }
    
    func loadImageData() {
        guard let imageURL = URL(string: model.imageName) else {
            //TODO Handle sad path for invalid URL
            return
        }
        
        onImageLoadingStateChange?(true)
        
        cancellable = imageLoader(imageURL).sink(receiveCompletion: { completion in
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
