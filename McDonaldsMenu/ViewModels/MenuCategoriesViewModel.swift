//
//  MenuCategoriesViewModel.swift
//  McDonaldsMenu
//
//  Created by Mario Alberto Barragán Espinosa on 22/07/22.
//

import Foundation
import Combine

final class MenuCategoriesViewModel {
    private let loader: () -> AnyPublisher<[MenuCategory], Error>
    private var cancellable: Cancellable?
    
    var onFetch: (([MenuCategory]) -> Void)?
    
    init(loader: @escaping () -> AnyPublisher<[MenuCategory], Error>) {
        self.loader = loader
    }
    
    func fetch() {
        cancellable = loader()
            .dispatchOnMainQueue()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure:
                    // TODO: Handle error
                    print("Network failure!!!")
                    
                case .finished: break
                }
            }, receiveValue: { [weak self] menuCategories in
                self?.onFetch?(menuCategories)
            })
    }
}
