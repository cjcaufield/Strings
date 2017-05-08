//
//  Quality.swift
//  Strings
//
//  Created by Colin Caufield on 2017-02-12.
//  Copyright © 2017 Secret Geometry, Inc. All rights reserved.
//

import Foundation

enum Quality {
    
    case major
    case minor
    case augmented
    case diminished
    
    var description: String {
        
        switch self {
            
        case .major:
            return ""
            
        case .minor:
            return "m"
            
        case .augmented:
            return "aug"
            
        case .diminished:
            return "dim"
        }
    }
}
