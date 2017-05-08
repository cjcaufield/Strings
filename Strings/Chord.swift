//
//  Chord.swift
//  Strings
//
//  Created by Colin Caufield on 2017-02-12.
//  Copyright © 2017 Secret Geometry, Inc. All rights reserved.
//

import Foundation

struct Chord: CustomStringConvertible {
    
    var root: DiatonicNote = 1
    var quality: Quality = .major
    var additions: [DiatonicNote] = []
    
    init(_ root: DiatonicNote = 1, _ quality: Quality = .major, additions: [DiatonicNote] = []) {
        self.root = root
        self.quality = quality
        self.additions = additions
    }
    
    var description: String {
        return "\(self.root) \(self.quality)"
    }
}

// Major Chords

let I   = Chord(1, .major)
let II  = Chord(2, .major)
let III = Chord(3, .major)
let IV  = Chord(4, .major)
let V   = Chord(5, .major)
let VI  = Chord(6, .major)
let VII = Chord(7, .major)

let bII  = Chord(b2, .major)
let bIII = Chord(b3, .major)
let bV   = Chord(b5, .major)
let bVI  = Chord(b6, .major)
let bVII = Chord(b7, .major)

// Minor Chords

let i   = Chord(1, .minor)
let ii  = Chord(2, .minor)
let iii = Chord(3, .minor)
let iv  = Chord(4, .minor)
let v   = Chord(5, .minor)
let vi  = Chord(6, .minor)
let vii = Chord(7, .minor)

let bii  = Chord(b2, .minor)
let biii = Chord(b3, .minor)
let bv   = Chord(b5, .minor)
let bvi  = Chord(b6, .minor)
let bvii = Chord(b7, .minor)

// Augmented Chords

let Iaug   = Chord(1, .augmented)
let IIaug  = Chord(2, .augmented)
let IIIaug = Chord(3, .augmented)
let IVaug  = Chord(4, .augmented)
let Vaug   = Chord(5, .augmented)
let VIaug  = Chord(6, .augmented)
let VIIaug = Chord(7, .augmented)

let bIIaug  = Chord(b2, .augmented)
let bIIIaug = Chord(b3, .augmented)
let bVaug   = Chord(b5, .augmented)
let bVIaug  = Chord(b6, .augmented)
let bVIIaug = Chord(b7, .augmented)

// Diminished Chords

let idim   = Chord(1, .diminished)
let iidim  = Chord(2, .diminished)
let iiidim = Chord(3, .diminished)
let ivdim  = Chord(4, .diminished)
let vdim   = Chord(5, .diminished)
let vidim  = Chord(6, .diminished)
let viidim = Chord(7, .diminished)

let biidim  = Chord(b2, .diminished)
let biiidim = Chord(b3, .diminished)
let bvdim   = Chord(b5, .diminished)
let bvidim  = Chord(b6, .diminished)
let bviidim = Chord(b7, .diminished)
