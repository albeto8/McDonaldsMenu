//
//  ImageDataLoader.swift
//  McDonaldsMenu
//
//  Created by Mario Alberto Barragán Espinosa on 21/07/22.
//

import Foundation

protocol ImageDataLoader {  
    func loadImageData(from url: URL) throws -> Data
}
