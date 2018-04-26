//
//  ViewController.swift
//  BMICalculator
//
//  Created by Jonathan Chong on 4/11/18.
//  Copyright © 2018 Jonathan Chong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var weightInt : Float = 80.0
    @IBOutlet weak var weightLabel: UILabel!
    @IBAction func slider(_ sender: UISlider) {
        weightLabel.text = String(format: "%.1f", 80 +  sender.value)
        weightInt = 80 + sender.value.rounded()
    }
    
    var heightFeet : Float = 0
    var heightInches : Float = 0
    var heightFeetInt : Int = 0
    var heightInchesInt : Int = 0
    var heightInInches : Float = 48
    @IBOutlet weak var heightLabel: UILabel!
    @IBAction func heightSlider(_ sender: UISlider) {
        heightFeet = ((sender.value)/12).rounded(.down)
        heightFeetInt = 4 + Int(heightFeet)
        heightInches = (sender.value).truncatingRemainder(dividingBy: 12)
        heightInchesInt = Int(heightInches)
        heightLabel.text = ("\(heightFeetInt)'\(heightInchesInt)")
        heightInInches = 48 + sender.value
    }
    
    @IBOutlet weak var bmiLabel: UILabel!
    var bmiResult : Float = 0
    var bmiResultString : String = ""
    var kg : Float = 0
    var meters : Float = 0
    @IBAction func calculateBMI(_ sender: UIButton) {
        kg = weightInt * 0.453592
        meters = heightInInches * (0.0254)
        bmiResult = kg/(meters*meters)
        bmiResultString = String(format: "%.2f", bmiResult)
        if bmiResult > 25 {
            bmiLabel.text = String("\(bmiResultString) You are overweight :(")
        }
        else if bmiResult > 18.5 {
            bmiLabel.text = String("\(bmiResultString) You are normal Weight!!")
        }
        else {
            bmiLabel.text = String("\(bmiResultString) You are underweight :(")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    

}

