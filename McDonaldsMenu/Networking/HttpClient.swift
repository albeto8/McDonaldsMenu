//
//  HttpClient.swift
//  McDonaldsMenu
//
//  Created by Mario Alberto Barragán Espinosa on 21/07/22.
//

import Foundation

protocol HTTPClientTask {
    func cancel()
}

protocol HTTPClient {
    typealias Result = Swift.Result<(Data, HTTPURLResponse), Error>
    @discardableResult
    func get(from url: URL, completion: @escaping (Result) -> Void) -> HTTPClientTask
}
