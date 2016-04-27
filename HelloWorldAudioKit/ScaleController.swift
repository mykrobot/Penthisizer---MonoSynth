//
//  ScaleController.swift
//  HelloWorldAudioKit
//
//  Created by Michael Mecham on 4/25/16.
//  Copyright © 2016 MichaelMecham. All rights reserved.
//

import Foundation

class ScaleController {
    
    static let sharedController = ScaleController()
    
    var currentScale:[Double] = []
    var availableScales:[[Double]] = []
    
    let C2 = 65.41
    let CS2 = 69.30
    let D2 = 73.42
    let DS2 = 77.78
    let E2 = 82.41
    let F2 = 87.31
    let FS2 = 92.50
    let G2 = 98.00
    let GS2 = 103.83
    let A2 = 110.0
    let AS2 = 116.54
    let B2 = 123.47
    
    let C3 = 130.81
    let CS3 = 138.59
    let D3 = 146.83
    let DS3 = 155.56
    let E3 = 164.81
    let F3 = 174.61
    let FS3 = 185.00
    let G3 = 196.00
    let GS3 = 207.65
    let A3 = 220.0
    let AS3 = 233.08
    let B3 = 246.94
    
    let C4 = 261.63
    let CS4 = 277.18
    let D4 = 293.66
    let DS4 = 311.13
    let E4 = 329.63
    let F4 = 349.23
    let FS4 = 369.99
    let G4 = 392.00
    let GS4 = 415.30
    let A4 = 440.0
    let AS4 = 466.16
    let B4 = 493.88
    
    let C5 = 523.25
    let CS5 = 554.37
    let D5 = 587.33
    let DS5 = 622.25
    let E5 = 659.25
    let F5 = 698.46
    let FS5 = 739.99
    let G5 = 783.99
    let GS5 = 830.61
    let A5 = 880.0
    let AS5 = 932.33
    let B5 = 987.77
    
//    let C6 = 1046.50
//    let CS6 = 1108.73
//    let D6 = 1174.66
//    let DS6 = 1244.51
//    let E6 = 1318.51
//    let F6 = 1396.91
//    let FS6 = 1479.98
//    let G6 = 1567.98
//    let GS6 = 1661.22
//    let A6 = 1760.0
//    let AS6 = 1864.66
//    let B6 = 1975.53
//    
//    let C1 = 32.70
//    let CS1 = 34.65
//    let D1 = 36.71
//    let DS1 = 38.89
//    let E1 = 41.20
//    let F1 = 43.65
//    let FS1 = 46.25
//    let G1 = 49.00
//    let GS1 = 51.91
//    let A1 = 55.0
//    let AS1 = 58.27
//    let B1 = 61.74
    
    
    var CMaj:[Double] {
        return [C2, D2, E2, G2, A2, C3, D3, E3, G3, A3, C4, D4, E4, G4, A4, C5] // C, D, E, G, A, C
    }
    var CSMaj:[Double] {
        return [CS2, DS2, F2, GS2, AS2, CS3, DS3, F3, GS3, AS3, CS4, DS4, F4, GS4, AS4, CS5] // C#, D#, F, G#, A#, C#
    }
    var DMaj:[Double] {
     return [D2, E2, FS2, A2, B2, D3, E3, FS3, A3, B3, D4, E4, FS4, A4, B4, D5] // D, E, F#, A, B, D
    }
    var DSMaj:[Double] {
        return [DS2, F2, G2, AS2, C3, DS3, F3, G3, AS3, C4, DS4, F4, G4, AS4, C5, DS5] // D#, F, G, A#, C, D#
    }
    var EMaj:[Double] {
        return [E2, FS2, GS2, B2, CS3, E3, FS3, GS3, B3, CS4, E4, FS4, GS4, B4, CS5, E5] // E, F#, G#, B, C#, E
    }
    var FMaj:[Double] {
        return [F2, G2, A2, C3, D3, F3, G3, A3, C4, D4, F4, G4, A4, C5, D5, F5] // F, G, A, C, D, F
    }
    var FSMaj:[Double] {
        return [FS2, GS2, AS2, CS3, DS3, FS3, GS3, AS3, CS4, DS4, FS4, GS4, AS4, CS5, DS5, FS5] // F#, G#, A#, C#, D#, F#
    }
    var GMaj:[Double] {
        return [G2, A2, B2, D3, E3, G3, A3, B3, D4, E4, G4, A4, B4, D5, E5, G5] // G, A, B, D, E, G
    }
    var GSMaj:[Double] {
        return [GS2, AS2, C3, DS3, F3, GS3, AS3, C4, DS4, F4, GS4, AS4, C5, DS5, F5, GS5] // G#, A#, C, D#, F, G#
    }
    var AMaj:[Double] {
        return [A2, B2, CS3, E3, FS3, A3, B3, CS4, E4, FS4, A4, B4, CS5, E5, FS5, A5] // A, B, C#, E, F#, A
    }
    var ASMaj:[Double] {
        return [AS2, C3, D3, F3, G3, AS3, C4, D4, F4, G4, AS4, C5, D5, F5, G5, AS5] // A#, C, D, F, G, A#
    }
    var BMaj:[Double] {
        return [B2, CS3, DS3, FS3, GS3, B3, CS4, DS4, FS4, GS4, B4, CS5, DS5, FS5, GS5, B5] // B, C#, D#, F#, G#,B
    }
    
    var CMin:[Double] {
        return [C2, DS2, F2, G2, AS2, C3, DS3, F3, G3, AS3, C4, DS4, F4, G4, AS4, C5] // C, Eb, F, G, Bb, C
    }
    var CSMin:[Double] {
        return [CS2, E2, FS2, GS2, B2, CS3, E3, FS3, GS3, B3, CS4, E4, FS4, GS4, B4, CS5] // C#, E, F#, G#, B, C#
    }
    var DMin:[Double] {
        return [D2, F2, G2, A2, C3, D3, F3, G3, A3, C4, D4, F4, G4, A4, C5, D5] // D, F, G, A, C, D
    }
    var DSMin:[Double] {
        return [DS2, FS2, GS2, AS2, CS3, DS3, FS3, GS3, AS3, CS4, DS4, FS4, GS4, AS4, CS5, DS5] // D#, F#, G#, A#, C#, D#
    }
    var EMin:[Double] {
        return [E2, G2, A2, B2, D3, E3, G3, A3, B3, D4, E4, G4, A4, B4, D5, E5] // E, G, A, B, D, E
    }
    var FMin:[Double] {
        return [F2, GS2, AS2, C3, DS3, F3, GS3, AS3, C4, DS4, F4, GS4, AS4, C5, DS5, F5] // F, Ab, Bb, C, Eb, F
    }
    var FSMin:[Double] {
        return [FS2, A2, B2, CS3, E3, FS3, A3, B3, CS4, E4, FS4, A4, B4, CS5, E5, FS5] // F#, A, B, C#, E, F#
    }
    var GMin:[Double] {
        return [G2, AS2, C3, D3, F3, G3, AS3, C4, D4, F4, G4, AS4, C5, D5, F5, G5] // G, Bb, C, D, F, G
    }
    var GSMin:[Double] {
        return [GS2, B2, CS3, DS3, FS3, GS3, B3, CS4, DS4, FS4, GS4, B4, CS5, DS5, FS5, GS5] // G#, B, C#, D#, F#, G#
    }
    var AMin:[Double] {
        return [A2, C3, D3, E3, G3, A3, C4, D4, E4, G4, A4, C5, D5, E5, G5, A5] // A, C, D, E, G, A
    }
    var ASMin:[Double] {
        return [AS2, CS3, DS3, F3, GS3, AS3, CS4, DS4, F4, GS4, AS4, CS5, DS5, F5, GS5, AS5] // A#, C#, D#, E#, G#, A#
    }
    var BMin:[Double] {
        return [B2, D3, E3, FS3, A3, B3, D4, E4, FS4, A4, B4, D5, E5, FS5, A5, B5] // B, D, E, F#, A, B
    }
    
    
    init() {
        currentScale = CMaj
        availableScales = [CMaj,GMaj,DMaj,AMaj,EMaj,BMaj,FSMaj,CSMaj,GSMaj,DSMaj,ASMaj,FMaj,AMin,EMin,BMin,FSMin,CSMin,GSMin,DSMin,ASMin,FMin,CMin,GMin,DMin]
    }
 
}
