//
//  ImageDataMapper.swift
//  McDonaldsMenu
//
//  Created by Mario Alberto Barragán Espinosa on 22/07/22.
//

import Foundation

final class ImageDataMapper {
    public enum Error: Swift.Error {
        case invalidData
    }
    
    public static func map(_ data: Data, from response: HTTPURLResponse) throws -> Data {
        guard response.statusCode == 200, !data.isEmpty else {
            throw Error.invalidData
        }
        
        return data
    }
}
