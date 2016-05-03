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

class ViewController: UIViewController {
    
    let manager = CMMotionManager()
    
    var currentScale:[Double] {
        return ScaleController.sharedController.currentScale
    }
    var leadOsc = SynthController.sharedController.leadOsc
    
    var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prefersStatusBarHidden()
        let mixer = AKMixer(SynthController.sharedController.reverb)
        AudioKit.output = mixer
        AudioKit.start()
        setupDeviceMotion()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
        let touch: UITouch = touches.first! as UITouch
        let xPoint = touch.preciseLocationInView(self.view).x
        coordinateToFrequency(xPoint)
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesMoved(touches, withEvent: event)
        let touch: UITouch = touches.first! as UITouch
        let xPoint = touch.preciseLocationInView(self.view).x
        coordinateToFrequency(xPoint)
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesEnded(touches, withEvent: event)
        leadOsc.amplitude = 0.01
    }
    
    func coordinateToFrequency(freq: CGFloat) {
        leadOsc.amplitude = 0.7
        let box = self.view.frame.width / 16
        switch freq {
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
    }
    
    // MARK: - CoreMotion Methods
    
    func setupDeviceMotion() {
        if manager.deviceMotionAvailable {
            manager.deviceMotionUpdateInterval = 0.02
            manager.startDeviceMotionUpdatesToQueue(NSOperationQueue.mainQueue(), withHandler: { (data, error) in
                if data?.userAcceleration.x < -1.75 {
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
}

