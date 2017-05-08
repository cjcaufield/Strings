//
//  Pattern.swift
//  Strings
//
//  Created by Colin Caufield on 2017-01-16.
//  Copyright © 2017 Secret Geometry, Inc. All rights reserved.
//

import Foundation

class Pattern {
    
    init(_ strings: [String], name: String, fretOffset: Int) {
        
        self.name = name
        self.strings = strings
        self.fretOffset = fretOffset
    }
    
    var name = ""
    var strings = [String]()
    var fretOffset = 0
    
    var fretCount: Int {
        
        if self.strings.isEmpty {
            return 0
        }
        
        return self.strings[0].characters.count
    }
}
