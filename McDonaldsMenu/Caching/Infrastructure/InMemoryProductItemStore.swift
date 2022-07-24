//
//  InMemoryProductItemStore.swift
//  McDonaldsMenu
//
//  Created by Mario Alberto Barragán Espinosa on 24/07/22.
//

import Foundation

protocol ProductItemImageDataStore {    
    func insert(_ data: Data, for url: URL) throws
    func retrieve(dataForURL url: URL) throws -> Data?
}

final class InMemoryProductItemStore: ProductItemImageDataStore {
    private var feedImageDataCache: [URL: Data] = [:]
    
    func insert(_ data: Data, for url: URL) throws {
        feedImageDataCache[url] = data
    }
    
    func retrieve(dataForURL url: URL) throws -> Data? {
        feedImageDataCache[url]
    }
}
