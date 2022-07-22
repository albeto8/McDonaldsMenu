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
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = makeMainViewController()
        window?.makeKeyAndVisible()
    }
    
    private func makeMainViewController() -> MainMenuViewController {
        let menuCategoriesViewModel = MenuCategoriesViewModel(loader: makeMenuLoader)
        let viewController = MainMenuViewController(menuCategoriesViewModel: menuCategoriesViewModel)
        
        menuCategoriesViewModel.onFetch = { menuCategories in
            viewController.display(menuCategories)
        }
        
        return viewController
    }
    
    private func makeMenuLoader() -> AnyPublisher<[MenuCategory], Error> {
      return httpClient
        .getPublisher(url: url)
        .dispatchOnMainQueue()
        .tryMap(MenuMapper.map)
        .eraseToAnyPublisher()
    }
}

