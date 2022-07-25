//
//  SceneDelegate.swift
//  McDonaldsMenu
//
//  Created by Mario Alberto Barragán Espinosa on 20/07/22.
//

import UIKit
import Combine

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    let url = URL(string: "https://mcdonalds.trio.dev/menu")!
        
    private lazy var httpClient: HTTPClient = {
      URLSessionHTTPClient(session: URLSession(configuration: .ephemeral))
    }()
    
    private var navigationController = UINavigationController()
    
    private lazy var store = InMemoryProductItemStore()
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        navigationController = UINavigationController(rootViewController: makeMainViewController())
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    private func makeMainViewController() -> MainMenuViewController {
        let menuCategoriesViewModel = MenuCategoriesViewModel(loader: makeMenuLoader)
        let viewController = MainMenuViewController(menuCategoriesViewModel: menuCategoriesViewModel, imageLoader: makeImageLoader(url:), selection: showDetail(for:))
        
        menuCategoriesViewModel.onFetch = { menuCategories in
            viewController.display(menuCategories)
        }
        
        let logoImageView = UIImageView()
        logoImageView.image = UIImage(named: "logo")
        logoImageView.contentMode = .scaleAspectFit
        viewController.navigationItem.titleView = logoImageView
        
        return viewController
    }
    
    private func makeMenuLoader() -> AnyPublisher<[MenuCategory], Error> {
        return httpClient
            .getPublisher(url: url)
            .dispatchOnMainQueue()
            .tryMap(MenuMapper.map)
            .eraseToAnyPublisher()
    }
    
    private func makeImageLoader(url: URL) -> AnyPublisher<Data, Error> {
        let localImageLoader = LocalProductImageDataLoader(store: store)
        
        return localImageLoader
            .loadImageDataPublisher(from: url)
            .fallback(to: { [httpClient] in
                httpClient
                    .getPublisher(url: url)
                    .tryMap(ImageDataMapper.map)
                    .caching(to: localImageLoader, using: url)
            })
            .subscribe(on: DispatchQueue.global())
            .eraseToAnyPublisher()
    }
    
    private func showDetail(for product: Product) {
        let detailController = DetailViewController(product: product)
        detailController.modalPresentationStyle = .pageSheet
        navigationController.present(detailController, animated: true)
    }
}

