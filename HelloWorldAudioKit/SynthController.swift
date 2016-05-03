//
//  SynthController.swift
//  HelloWorldAudioKit
//
//  Created by Michael Mecham on 4/27/16.
//  Copyright © 2016 MichaelMecham. All rights reserved.
//

import Foundation
import AudioKit

class SynthController {
    
    static let sharedController = SynthController()
    
    let leadOsc = AKOscillator()
    var delay: AKDelay
    var reverb: AKReverb
    var tb303Filter: AKRolandTB303Filter
    
    init() {
        delay = AKDelay(leadOsc)
        reverb = AKReverb(delay)
        tb303Filter = AKRolandTB303Filter(reverb)
        
        setupDelay()
        filter303()
        setupReverb()
    }
    
    func filter303() {
        tb303Filter.cutoffFrequency = 2850
        tb303Filter.resonance = 0.5
    }
    
    func setupReverb() {
        reverb.loadFactoryPreset(.Cathedral)
    }
    
    func setupDelay() {
        delay.time = 0.5
        delay.feedback = 0.6
        delay.dryWetMix = 0.3
    }
}