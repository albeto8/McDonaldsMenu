//
//  Double+Extensions.swift
//  McDonaldsMenu
//
//  Created by Mario Alberto Barragán Espinosa on 25/07/22.
//

import Foundation

extension Double {
    var clean: String {
       return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}
