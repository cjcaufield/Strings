//
//  StringsView.swift
//  Strings
//
//  Created by Colin Caufield on 2017-01-09.
//  Copyright © 2017 Secret Geometry, Inc. All rights reserved.
//

import Foundation
import UIKit

class StringsView: UIView {
    
    // Dimensions
    
    var stringCount = 6
    var fretCount = 36
    
    // Patterns
    
    var patterns: [Pattern]? {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    // Colors
    
    var colorMap = DefaultColorMap()
    
    // Sizes
    
    var noteRadius = CGFloat(20.0)
    
    var xOffset: Double {
        return 0.0 //self.noteRadius
    }
    
    var stringGap: CGFloat {
        return self.bounds.size.height / CGFloat(self.stringCount + 1)
    }
    
    var fretGap: CGFloat {
        return self.bounds.size.width / CGFloat(self.fretCount + 1)
    }
    
    // Wood Type
    
    enum WoodType {
        
        case light
        case dark
    }
    
    var woodType = WoodType.dark
    
    // Strings
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    func setup() {
        self.contentMode = .redraw
    }
    
    // MARK: - Drawing
    
    func drawLine(from x1: CGFloat, _ y1: CGFloat, to x2: CGFloat, _ y2: CGFloat, width: CGFloat = 1.0) {
        
        let line = UIBezierPath()
        line.move(to: CGPoint(x: x1, y: y1))
        line.addLine(to: CGPoint(x: x2, y: y2))
        line.lineWidth = width
        line.stroke()
    }
    
    func drawUpperCurve(_ rect: CGRect, angle: CGFloat, width: CGFloat = 1.0, filled: Bool = true) {
        
        let lox = rect.origin.x
        let hix = lox + rect.size.width
        let hiy = rect.origin.y
        let loy = hiy + rect.size.height
        
        let left  = CGPoint(x: lox, y: loy)
        let right = CGPoint(x: hix, y: loy)
        let mid   = CGPoint(x: (lox + hix) / 2.0, y: hiy)
        
        let cp1 = CGPoint(x: lox, y: hiy)
        let cp2 = CGPoint(x: hix, y: hiy)
        
        let curve = UIBezierPath()
        curve.move(to: left)
        curve.addCurve(to: mid, controlPoint1: cp1, controlPoint2: cp1)
        curve.addCurve(to: right, controlPoint1: cp2, controlPoint2: cp2)
        curve.lineWidth = width
        curve.stroke()
    }
    
    func drawRectangle(_ rect: CGRect, filled: Bool = true) {
        
        let shape = UIBezierPath(rect: rect)
        
        if filled {
            shape.fill()
        } else {
            shape.stroke()
        }
    }
    
    func drawCircle(x: CGFloat, y: CGFloat, r: CGFloat) {
        
        let origin = CGPoint(x: x - r, y: y - r)
        let size = CGSize(width: 2.0 * r, height: 2.0 * r)
        let rect = CGRect(origin: origin, size: size)
        let circle = UIBezierPath(ovalIn: rect)
        circle.fill()
    }
    
    func drawText(x: CGFloat, y: CGFloat, string: String, color: XXColor) {
        
        let font = UIFont.systemFont(ofSize: 16)
        
        let attributes: [NSAttributedStringKey : Any] = [
            
            NSAttributedStringKey.font: font,
            NSAttributedStringKey.baselineOffset: 1.0,
            NSAttributedStringKey.foregroundColor: color
        ]
        
        let nsstring = string as NSString
        
        let size = nsstring.size(withAttributes: attributes)
        
        let rect = CGRect(x: x - 0.5 * size.width, y: y - 0.5 * size.height, width: size.width, height: size.height)
        
        // temp
        //UIColor.yellow.set()
        //self.drawRectangle(rect)
        
        nsstring.draw(in: rect, withAttributes: attributes)
    }
    
    func drawNote(string: Int, fret: Int, note: Int, style: NoteStyle, color: XXColor) {
        
        let radius = CGFloat(self.noteRadius)
        var usedRadius = radius
        
        usedRadius *= 0.9
        
        /*
        switch style {
         
        case .Root:
            break
         
        case .Primary:
            usedRadius *= 0.9
         
        case .Secondary:
            usedRadius *= 0.7
         
        case .None:
            usedRadius *= 0.0
        }
        */
        
        color.set()
        
        let x = CGFloat(fret) * self.fretGap + CGFloat(self.xOffset)
        let y = CGFloat(string) * self.stringGap
        
        self.drawCircle(x: x - radius, y: y, r: usedRadius)
        
        self.drawText(x: x - radius, y: y, string: String(note), color: UIColor.white)
    }
    
    func style(for note: Int) -> NoteStyle {
        
        switch note {
        case 1:  return .Root
        case 2:  return .Primary
        case 3:  return .Primary
        case 4:  return .Secondary
        case 5:  return .Primary
        case 6:  return .Primary
        case 7:  return .Secondary
        default: return .None
        }
    }
    
    func color(for note: Int) -> XXColor {
        
        // New method.
        
        return self.colorMap.color(for: note)
        
        // Old method.
        /*
        var r = CGFloat(0.0)
        var g = CGFloat(1.0)
        var b = CGFloat(0.0)
        var a = CGFloat(1.0)
         
        switch style {
         
        case .Root:
            r = 1.0
            g = 1.0
            b = 1.0
         
        case .Primary:
            r = 0.0
            g = 1.0
            b = 0.0
            a = 1.0
         
        case .Secondary:
            r = 0.0
            g = 0.6
            b = 0.0
            a = 1.0
         
        case .None:
            a = 0.0
        }
         
        return UIColor(red: r, green: g, blue: b, alpha: a)
        */
    }
    
    override func draw(_ rect: CGRect) {
        
        let viewWidth = rect.width
        let viewHeight = rect.height
        
        // Background
        
        UIColor(red: 0.0, green: 0.5, blue: 1.0, alpha: 0.5).set()
        self.drawRectangle(rect)
        
        // Border
        
        //UIColor.red.set()
        //self.drawRectangle(rect, filled: false)
        
        // Wood Colors
        
        var fretboardColor: UIColor!
        var headColor: UIColor!
        
        switch self.woodType {
            
        case .light:
            fretboardColor = UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0)
            headColor = UIColor(red: 1.0, green: 1.0, blue: 0.5, alpha: 1.0)
            
        case .dark:
            fretboardColor = UIColor(red: 0.6, green: 0.4, blue: 0.2, alpha: 1.0)
            headColor = UIColor(red: 0.3, green: 0.2, blue: 0.1, alpha: 1.0)
        }
        
        // Fretboard
        
        fretboardColor.set()
        
        var fretboardRect = rect
        fretboardRect.origin.y += 0.5 * self.stringGap
        fretboardRect.size.height -= self.stringGap
        
        self.drawRectangle(fretboardRect)
        
        // Head
        
        headColor.set()
        
        var head = fretboardRect
        head.size.width = CGFloat(self.fretGap)
        
        self.drawRectangle(head)
        
        // Nut and Frets
        
        let labelColor = UIColor(red: 0.0, green: 0.3, blue: 0.6, alpha: 1.0)
        
        for i in 0 ... fretCount {
            
            let x = CGFloat(i + 1) * self.fretGap + CGFloat(self.xOffset)
            
            // Nut
            if i == 0 {
                UIColor.black.set()
            }
            // Fret
            else {
                UIColor.gray.set()
            }
            
            // Draw the fret.
            self.drawLine(from: x, fretboardRect.origin.y, to: x, fretboardRect.origin.y + fretboardRect.size.height, width: 4.0)
            
            // Draw a label.
            self.drawText(x: x, y: viewHeight - 20.0, string: String(i), color: labelColor)
        }
        
        // Fret Markers
        
        UIColor.black.set()
        
        let markedFrets = [0, 3, 5, 7, 9]
        
        for i in 0 ... fretCount {
            if markedFrets.contains(i % 12) && i > 0 {
                let x = (CGFloat(i + 1) - 0.5) * self.fretGap + CGFloat(self.xOffset)
                self.drawCircle(x: x, y: viewHeight / 2.0, r: 10.0)
            }
        }
        
        // Strings
        
        UIColor.white.set()
        
        for i in 1 ... stringCount {
            let y = CGFloat(i) * self.stringGap
            let w = CGFloat(i)
            self.drawLine(from: 0.0, y, to: viewWidth, y, width: w)
        }
        
        // Loop through octaves.
        
        let octaveCount = Int(ceil(Double(self.fretCount) / 12.0))
        let rootFretOffset = 3
        
        var stringIndex = 1
        var fretIndex = 0
        
        //var alt = 1
        
        guard let patterns = self.patterns else {
            return
        }
        
        outer: for octave in -1 ..< octaveCount {
            
            for pattern in patterns {
                
                let startingFret = rootFretOffset + (12 * octave) + pattern.fretOffset
                
                if startingFret >= self.fretCount {
                    break outer
                }
                
                // Draw shape headers.
                
                UIColor.black.set()
                
                let endingFret = startingFret + pattern.fretCount
                
                let from = CGFloat(startingFret) * self.fretGap - 2.0 * self.noteRadius
                let to = CGFloat(endingFret - 1) * self.fretGap
                let mid = from + 0.5 * (to - from)
                
                let y = CGFloat(15.0) //CGFloat(20.0 + Float(alt) * 5.0)
                //alt *= -1
                
                //let rect = CGRect(x: from, y: y, width: to - from, height: 20.0)
                
                //self.drawUpperCurve(rect, angle: 90.0)
                
                //self.drawLine(from: from, y + 8.0, to: to, y + 8.0)
                
                self.drawText(x: mid, y: y, string: pattern.name, color: UIColor.black)
                
                //print("\(pattern.name), x=\(mid), y=\(y), octave=\(octave), fretOffset=\(pattern.fretOffset), startingFret=\(startingFret)")
                
                // Draw notes.
                
                stringIndex = 1
                fretIndex = startingFret
                
                for string in pattern.strings {
                    
                    for char in string.characters {
                        
                        if let note = Int(String(char)) {
                            
                            let style = self.style(for: note)
                            let color = self.color(for: note)
                            
                            self.drawNote(string: stringIndex,
                                          fret: fretIndex,
                                          note: note,
                                          style: style,
                                          color: color)
                        }
                        
                        fretIndex += 1
                    }
                    
                    stringIndex += 1
                    fretIndex = startingFret
                }
            }
        }
    }
}
