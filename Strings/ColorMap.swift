//
//  ColorMap.swift
//  Strings
//
//  Created by Colin Caufield on 2017-02-10.
//  Copyright © 2017 Secret Geometry, Inc. All rights reserved.
//

import Foundation
import UIKit

class ColorMap {
    
    func color(for note: Int) -> UIColor {
        return UIColor.black
    }
}

class DefaultColorMap: ColorMap {
    
    var map = [
        
        1: rgba255(   0,   0,   0 ),
        2: rgba255(   1, 102, 204 ),
        3: rgba255(   0, 153, 102 ),
        4: rgba255( 102,   0, 204 ),
        5: rgba255( 204,   0, 102 ),
        6: rgba255( 102, 153,   0 ),
        7: rgba255( 204, 102,   0 )
    ]
    
    override func color(for note: Int) -> UIColor {
        
        if let color = self.map[note] {
            return color
        } else {
            return UIColor.black
        }
    }
}
