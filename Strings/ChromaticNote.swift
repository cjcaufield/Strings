//
//  ChromaticNote.swift
//  Strings
//
//  Created by Colin Caufield on 2017-02-10.
//  Copyright © 2017 Secret Geometry, Inc. All rights reserved.
//

import Foundation

struct ChromaticNote: CustomStringConvertible, ExpressibleByIntegerLiteral {
    
    typealias IntegerLiteralType = Int
    
    var value = 0
    var octave = 4
    
    init(integerLiteral value: IntegerLiteralType) {
        self.value = value
    }
    
    init(_ value: Int = 0, octave: Int = 4) {
        self.value = value % 12
        self.octave = octave + value / 12
    }
    
    init(diatonicNote: DiatonicNote) {
        
        switch diatonicNote.value % 8 {
            
        case 1:
            self.value = 0
        
        case 2:
            self.value = 2
        
        case 3:
            self.value = 4
        
        case 4:
            self.value = 5
        
        case 5:
            self.value = 7
        
        case 6:
            self.value = 9
        
        case 7:
            self.value = 11
        
        default:
            assertionFailure()
        }
        
        switch diatonicNote.alteration {
            
        case .flat:
            self.value -= 1
            
        case .sharp:
            self.value += 1
            
        case .doubleflat:
            self.value -= 2
            
        case .doublesharp:
            self.value += 2
            
        default:
            break
        }
        
        self.octave = diatonicNote.octave + diatonicNote.value / 8
    }
    
    var description: String {
        return "\(self.value)"
    }
}
