//
//  DiatonicNote.swift
//  Strings
//
//  Created by Colin Caufield on 2017-02-11.
//  Copyright © 2017 Secret Geometry, Inc. All rights reserved.
//

import Foundation

struct DiatonicNote: CustomStringConvertible, ExpressibleByIntegerLiteral {
    
    typealias IntegerLiteralType = Int
    
    var value: Int = 1
    var alteration = Alteration.natural
    var octave = 4
    
    init(integerLiteral value: IntegerLiteralType) {
        self.value = value
    }
    
    init(_ value: Int = 1, alteration: Alteration = .natural, octave: Int = 4) {
        self.value = value % 8
        self.alteration = alteration
        self.octave = octave + value / 8
    }
    
    init(chromaticNote : ChromaticNote) {
        
        switch chromaticNote.value % 12 {
            
        case 0:
            self.value = 1
            
        case 1:
            self.value = 2
            self.alteration = .flat
            
        case 2:
            self.value = 2
            
        case 3:
            self.value = 3
            self.alteration = .flat
            
        case 4:
            self.value = 3
            
        case 5:
            self.value = 4
            
        case 6:
            self.value = 5
            self.alteration = .flat
            
        case 7:
            self.value = 5
            
        case 8:
            self.value = 6
            self.alteration = .flat
            
        case 9:
            self.value = 6
            
        case 10:
            self.value = 7
            self.alteration = .flat
            
        case 11:
            self.value = 7
            
        default:
            assertionFailure()
        }
        
        self.octave = chromaticNote.octave + chromaticNote.value / 12
    }
    
    var description: String {
        return "\(self.alteration)\(self.value)"
    }
}

let b2 = DiatonicNote(2, alteration: .flat)
let b3 = DiatonicNote(3, alteration: .flat)
let b5 = DiatonicNote(5, alteration: .flat)
let b6 = DiatonicNote(6, alteration: .flat)
let b7 = DiatonicNote(7, alteration: .flat)
