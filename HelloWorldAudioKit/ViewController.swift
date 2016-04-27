//
//  ViewController.swift
//  HelloWorldAudioKit
//
//  Created by Michael Mecham on 4/21/16.
//  Copyright © 2016 MichaelMecham. All rights reserved.
//

import UIKit
import AudioKit
import CoreMotion


let bundle = NSBundle.mainBundle()
let file = bundle.pathForResource("HWDrum1", ofType: "wav")
let oscillator = AKOscillator()
let leadOsc = AKOscillator()

var cutoffFreq = 1100
var resonance = 0.9
var filterMix = 0.9

var lfoAmplitude = 1000
var lfoRate = 1.0 / 3.428




class ViewController: UIViewController {

    let manager = CMMotionManager()
    //let player = AKAudioPlayer(file!)
    let delay = AKDelay(leadOsc)
    
    let ringMod = AKRingModulator(leadOsc)
    let reverb = AKReverb(leadOsc)
    let highPassFilter = AKLowPassFilter(leadOsc)
    
    var currentScale:[Double] {
        return ScaleController.sharedController.currentScale
    }
    
    
    var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //player.looping = true
        let mixer = AKMixer(delay)
        reverb.loadFactoryPreset(.Cathedral)
        AudioKit.output = mixer
        AudioKit.start()
        //player.play()
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        setupDeviceMotion()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    static func scalechanged() {
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
        let touch: UITouch = touches.first! as UITouch
        leadOsc.amplitude = 0.3
        let xPoint = touch.preciseLocationInView(self.view).x
        let box = self.view.frame.width / 16
        
        switch xPoint {
        case 0...box:
            leadOsc.frequency = currentScale[0]
            print("0")
            leadOsc.start()
        case box...box * 2:
            leadOsc.frequency = currentScale[1]
            print("1")
            leadOsc.start()
        case box * 2...box * 3:
            leadOsc.frequency = currentScale[2]
            print("2")
            leadOsc.start()
        case box * 3...box * 4:
            leadOsc.frequency = currentScale[3]
            print("3")
            leadOsc.start()
        case box * 4...box * 5:
            leadOsc.frequency = currentScale[4]
            print("4")
            leadOsc.start()
        case box * 5...box * 6:
            leadOsc.frequency = currentScale[5]
            print("5")
            leadOsc.start()
        case box * 6...box * 7:
            leadOsc.frequency = currentScale[6]
            print("6")
            leadOsc.start()
        case box * 7...box * 8:
            leadOsc.frequency = currentScale[7]
            print("7")
            leadOsc.start()
        case box * 8...box * 9:
            leadOsc.frequency = currentScale[8]
            print("8")
            leadOsc.start()
        case box * 9...box * 10:
            leadOsc.frequency = currentScale[9]
            print("9")
            leadOsc.start()
        case box * 10...box * 11:
            leadOsc.frequency = currentScale[10]
            print("10")
            leadOsc.start()
        case box * 11...box * 12:
            leadOsc.frequency = currentScale[11]
            print("11")
            leadOsc.start()
        case box * 12...box * 13:
            leadOsc.frequency = currentScale[12]
            print("12")
            leadOsc.start()
        case box * 13...box * 14:
            leadOsc.frequency = currentScale[13]
            print("13")
            leadOsc.start()
        case box * 14...box * 15:
            leadOsc.frequency = currentScale[14]
            print("14")
            leadOsc.start()
        case box * 15...box * 16:
            leadOsc.frequency = currentScale[15]
            print("15")
            leadOsc.start()
        default:
            leadOsc.frequency = 0.0
        }
        delay.time = 0.5
        delay.feedback = 0.5
        delay.dryWetMix = 0.7
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesMoved(touches, withEvent: event)
        let touch: UITouch = touches.first! as UITouch
        leadOsc.amplitude = 0.3
        let xPoint = touch.preciseLocationInView(self.view).x
        let box = self.view.frame.width / 16
        
        switch xPoint {
        case 0...box:
            leadOsc.frequency = currentScale[0]
            print("0")
            leadOsc.start()
        case box...box * 2:
            leadOsc.frequency = currentScale[1]
            print("1")
            leadOsc.start()
        case box * 2...box * 3:
            leadOsc.frequency = currentScale[2]
            print("2")
            leadOsc.start()
        case box * 3...box * 4:
            leadOsc.frequency = currentScale[3]
            print("3")
            leadOsc.start()
        case box * 4...box * 5:
            leadOsc.frequency = currentScale[4]
            print("4")
            leadOsc.start()
        case box * 5...box * 6:
            leadOsc.frequency = currentScale[5]
            print("5")
            leadOsc.start()
        case box * 6...box * 7:
            leadOsc.frequency = currentScale[6]
            print("6")
            leadOsc.start()
        case box * 7...box * 8:
            leadOsc.frequency = currentScale[7]
            print("7")
            leadOsc.start()
        case box * 8...box * 9:
            leadOsc.frequency = currentScale[8]
            print("8")
            leadOsc.start()
        case box * 9...box * 10:
            leadOsc.frequency = currentScale[9]
            print("9")
            leadOsc.start()
        case box * 10...box * 11:
            leadOsc.frequency = currentScale[10]
            print("10")
            leadOsc.start()
        case box * 11...box * 12:
            leadOsc.frequency = currentScale[11]
            print("11")
            leadOsc.start()
        case box * 12...box * 13:
            leadOsc.frequency = currentScale[12]
            print("12")
            leadOsc.start()
        case box * 13...box * 14:
            leadOsc.frequency = currentScale[13]
            print("13")
            leadOsc.start()
        case box * 14...box * 15:
            leadOsc.frequency = currentScale[14]
            print("14")
            leadOsc.start()
        case box * 15...box * 16:
            leadOsc.frequency = currentScale[15]
            print("15")
            leadOsc.start()
        default:
            leadOsc.frequency = 0.0
        }
        delay.time = 0.5
        delay.feedback = 0.5
        delay.dryWetMix = 0.7
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesEnded(touches, withEvent: event)
        
    }
    
    
    // MARK: - CoreMotion Methods
    
    func setupDeviceMotion() {
        if manager.deviceMotionAvailable {
            manager.deviceMotionUpdateInterval = 0.02
            manager.startDeviceMotionUpdatesToQueue(NSOperationQueue.mainQueue(), withHandler: { (data, error) in
                if data?.userAcceleration.x < -1.5 {
                    self.manager.stopDeviceMotionUpdates()
                    self.performSelector(#selector(self.triggerReveal))
                }
            })
        }
    }
    
    func triggerReveal() {
        self.revealViewController().revealToggle(self)
        setupDeviceMotion()
    }
    
    //    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
    //        super.touchesBegan(touches, withEvent: event)
    //        let touch: UITouch = touches.first! as UITouch
    //
    //
    //        if (touch.view != bassView) {
    //            print("Bass")
    //            leadOsc.amplitude = 0.1
    //            let xPoint = touch.preciseLocationInView(leadView).x
    //            leadOsc.frequency = Double(xPoint * 2)
    //            leadOsc.start()
    //        } else {
    //            leadOsc.amplitude = 0.1
    //            let xPoint = touch.preciseLocationInView(leadView).x
    //            let yPoint = touch.preciseLocationInView(leadView).y
    //
    //            highPassFilter.cutoffFrequency = Double(yPoint)
    //            delay.time = Double(yPoint / 415)
    //            delay.feedback = 0.8
    //            delay.dryWetMix = 0.5
    //            leadOsc.frequency = Double(xPoint * 2)
    //            leadOsc.start()
    //        }
    //    }
    //
    //    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
    //        super.touchesMoved(touches, withEvent: event)
    //        let touch: UITouch = touches.first! as UITouch
    //
    //        if (touch.view != bassView) {
    //            print("Bass")
    //            leadOsc.amplitude = 0.1
    //            let xPoint = touch.preciseLocationInView(leadView).x
    //            leadOsc.frequency = Double(xPoint * 2)
    //            leadOsc.start()
    //        } else {
    //            leadOsc.amplitude = 0.1
    //            let xPoint = touch.preciseLocationInView(leadView).x
    //            let yPoint = touch.preciseLocationInView(leadView).y
    //            highPassFilter.cutoffFrequency = Double(yPoint)
    //            delay.time = Double(yPoint / 600)
    //            delay.feedback = 0.8
    //            delay.dryWetMix = 0.5
    //            leadOsc.frequency = Double(xPoint * 2)
    //            leadOsc.start()
    //        }
    //
    //    }
    
    //    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
    //        super.touchesMoved(touches, withEvent: event)
    //        let touch: UITouch = touches.first! as UITouch
    //
    //        if (touch.view == bassView) {
    //            let yPoint = touch.preciseLocationInView(bassView).y
    //            oscillator.frequency = Double(yPoint / 2)
    //        }
    //    }
    //
    //    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
    //        super.touchesMoved(touches, withEvent: event)
    //        let touch: UITouch = touches.first! as UITouch
    //
    //        if (touch.view == bassView) {
    //           //oscillator.amplitude = 0.0
    //        }
    //
    //    }
    
}

