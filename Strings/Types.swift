//
//  Types.swift
//  Strings
//
//  Created by Colin Caufield on 2017-01-25.
//  Copyright © 2017 Secret Geometry, Inc. All rights reserved.
//

import Foundation

#if os(iOS)
    
    import UIKit
    
    typealias XXFont = UIFont
    typealias XXColor = UIColor
    
#else
    
    import Cocoa
    
    typealias XXFont = NSFont
    typealias XXColor = NSColor
    
#endif
