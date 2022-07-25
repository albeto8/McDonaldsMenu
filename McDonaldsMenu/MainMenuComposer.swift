//
//  MainMenuComposer.swift
//  McDonaldsMenu
//
//  Created by Mario Alberto Barragán Espinosa on 25/07/22.
//

import UIKit
import Combine

final class MainMenuComposer {
    private init() {}
    
    static func build(loader: @escaping () -> AnyPublisher<[MenuCategory], Error>,
                      imageLoader: @escaping (URL) -> ImageDataLoader.Publisher,
                      selection: @escaping (ProductViewModel<UIImage>) -> Void) -> MainMenuViewController {
        let menuCategoriesViewModel = MenuCategoriesViewModel(loader: loader)
        let viewController = MainMenuViewController(menuCategoriesViewModel: menuCategoriesViewModel, imageLoader: imageLoader, selection: selection)
        
        menuCategoriesViewModel.onFetch = { menuCategories in
            viewController.display(menuCategories)
        }
        
        let logoImageView = UIImageView()
        logoImageView.image = UIImage(named: "logo")
        logoImageView.contentMode = .scaleAspectFit
        viewController.navigationItem.titleView = logoImageView
        
        return viewController
    }
}
