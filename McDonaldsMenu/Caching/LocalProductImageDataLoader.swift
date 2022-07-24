//
//  LocalProductImageDataLoader.swift
//  McDonaldsMenu
//
//  Created by Mario Alberto Barragán Espinosa on 24/07/22.
//

import Foundation

protocol ProductItemImageDataCache {
    func save(_ data: Data, for url: URL) throws
}

final class LocalProductImageDataLoader {
    private let store: ProductItemImageDataStore
    
    init(store: ProductItemImageDataStore) {
        self.store = store
    }
}

//MARK: ProductItemImageDataCache

extension LocalProductImageDataLoader: ProductItemImageDataCache {    
    enum SaveError: Error {
        case failed
    }

    func save(_ data: Data, for url: URL) throws {
        do {
            try store.insert(data, for: url)
        } catch { 
            throw SaveError.failed 
        }
    }
}

//MARK: ImageDataLoader

extension LocalProductImageDataLoader: ImageDataLoader {
    enum LoadError: Error {
        case failed
        case notFound
    }
    
    func loadImageData(from url: URL) throws -> Data {
        do {
            if let imageData = try store.retrieve(dataForURL: url) {
                return imageData
            }
        } catch { 
            throw LoadError.failed 
        }
        throw LoadError.notFound
    }
}
