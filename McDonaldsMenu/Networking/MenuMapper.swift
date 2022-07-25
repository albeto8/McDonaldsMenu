//
//  MenuMapper.swift
//  McDonaldsMenu
//
//  Created by Mario Alberto Barragán Espinosa on 21/07/22.
//

import Foundation

final class MenuMapper {
    private struct Root: Decodable {
        let menus: [RemoteMenu]
    }
    
    struct RemoteMenu: Decodable {
        let name: String
        let items: [RemoteProduct]
        
        struct RemoteProduct: Decodable {
            let name: String
            let description: String
            let price: Double
            let url: String
            
            var toModel: Product {
              Product(name: name, 
                      imagePath: url, 
                      productDescription: description, 
                      price: price)
            }
        }
        
        var toModel: MenuCategory {
            MenuCategory(title: name, products: items.map({ $0.toModel }))
        }
    }
    
    enum Error: Swift.Error {
        case invalidData
    }
    
    static func map(_ data: Data, from response: HTTPURLResponse) throws -> [MenuCategory] {
        guard response.statusCode == 200,
              let root = try? JSONDecoder().decode(Root.self, from: data) else {
          throw Error.invalidData
        }
        
        return root.menus.map({ $0.toModel })
    }
}
