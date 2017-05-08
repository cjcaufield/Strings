//
//  Utilities.swift
//  Strings
//
//  Created by Colin Caufield on 2017-02-11.
//  Copyright © 2017 Secret Geometry, Inc. All rights reserved.
//

import Foundation
import UIKit

func rgba(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ a: CGFloat = 1.0) -> UIColor {
    return UIColor(red: r, green: g, blue: b, alpha: a)
}

func rgba255(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ a: CGFloat = 255.0) -> UIColor {
    return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a / 255.0)
}
