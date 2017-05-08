//
//  Scales.swift
//  Strings
//
//  Created by Colin Caufield on 2017-01-09.
//  Copyright © 2017 Secret Geometry, Inc. All rights reserved.
//

import Foundation

enum Shape: Int {
    
    case all
    case c
    case a
    case g
    case e
    case d
}

class Scales {
    
    class Pentatonic {
        
        static func patterns(shape: Shape) -> [Pattern] {
            
            switch shape {
                case .all:  return [eShape, dShape, cShape, aShape, gShape]
                case .c:    return [cShape]
                case .a:    return [aShape]
                case .g:    return [gShape]
                case .e:    return [eShape]
                case .d:    return [dShape]
            }
        }
        
        static let cShape = Pattern(
            
            [
                "34 5",
                "71 2",
                "5 6 ",
                "2 34",
                "6 71",
                "34 5"
            ],
            
            name: "C-Shape",
            fretOffset: 5
        )
        
        static let aShape = Pattern(
            
            [
                " 5 6 ",
                " 2 34",
                "6 71 ",
                "34 5 ",
                "71 2 ",
                " 5 6 "
            ],
            
            name: "A-Shape",
            fretOffset: 7
        )
        
        static let gShape = Pattern(
            
            [
                " 6 71",
                " 34 5",
                "71 2 ",
                " 5 6 ",
                " 2 34",
                " 6 71"
            ],
            
            name: "G-Shape",
            fretOffset: 9
        )
        
        static let eShape = Pattern(
            
            [
                "71 2",
                " 5 6",
                "2 34",
                "6 71",
                "34 5",
                " 1 2"
            ],
            
            name: "E-Shape",
            fretOffset: 0
        )
        
        static let dShape = Pattern(
            
            [
                " 2 34",
                " 6 71",
                "34 5 ",
                "71 2 ",
                " 5 6 ",
                " 2 34"
            ],
            
            name: "D-Shape",
            fretOffset: 2
        )
    }
}
