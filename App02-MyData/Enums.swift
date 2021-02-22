//
//  Enums.swift
//  App02-MyData
//
//  Created by user189351 on 2/21/21.
//

import Foundation

enum ActiveSheet: Identifiable {
    case edit, image
    
    var id: Int {
        hashValue
    }
}
