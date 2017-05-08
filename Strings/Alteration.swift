//
//  Alteration.swift
//  Strings
//
//  Created by Colin Caufield on 2017-02-11.
//  Copyright © 2017 Secret Geometry, Inc. All rights reserved.
//

import Foundation

enum Alteration: CustomStringConvertible {
    
    case natural
    case flat
    case sharp
    case doubleflat
    case doublesharp
    
    var description: String {
        
        switch self {
        
        case .natural:
            return ""
            
        case .flat:
            return "b"
            
        case .sharp:
            return "#"
            
        case .doubleflat:
            return "bb"
            
        case .doublesharp:
            return "##"
        }
    }
}
