//
//  ViewController.swift
//  Dizainier_S
//
//  Created by Robin Blottière--Mayo on 23/09/2018.
//  Copyright © 2018 Robin Blottière--Mayo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	@IBOutlet weak var NumberLabelOutlet: UILabel!
	@IBOutlet weak var StepperOutlet: UIStepper!
	@IBOutlet weak var SliderOutlet: UISlider!
	@IBOutlet weak var TensSegmentOutlet: UISegmentedControl!
	@IBOutlet weak var UnitsSegmentOutlet: UISegmentedControl!
	@IBOutlet weak var SwitchOutlet: UISwitch!

	func assignmentMethode(value : Int) {
		var decimalNumber : String
		if (SwitchOutlet.isOn) {
			decimalNumber = String(value, radix:16)
		} else {
			decimalNumber = String(value)
		}
		if value == 42 {
			NumberLabelOutlet.textColor = UIColor.red
			NumberLabelOutlet.font = UIFont.boldSystemFont(ofSize: 17)
		} else {
			NumberLabelOutlet.textColor = UIColor.white
			NumberLabelOutlet.font = UIFont.systemFont(ofSize: 17)
		}
		NumberLabelOutlet.text = decimalNumber
		SliderOutlet.value = Float(value)
		TensSegmentOutlet.selectedSegmentIndex = Int(value / 10)
		UnitsSegmentOutlet.selectedSegmentIndex = Int(value % 10)
	}
	
	@IBAction func StepperAction(_ sender: UIStepper) {
		assignmentMethode(value:Int(StepperOutlet.value))
	}
	
	@IBAction func SliderAction(_ sender: UISlider) {
		StepperOutlet.value = Double(SliderOutlet.value)
		assignmentMethode(value:Int(StepperOutlet.value))
	}
	
	@IBAction func segmentAction(_ sender: UISegmentedControl) {
		StepperOutlet.value = Double(UnitsSegmentOutlet.selectedSegmentIndex + 10 * TensSegmentOutlet.selectedSegmentIndex)
		assignmentMethode(value:Int(StepperOutlet.value))	}
	
	@IBAction func SwitchAction(_ sender: UISwitch) {
		var decimalNumber : String
		if (SwitchOutlet.isOn) {
			decimalNumber = String(Int(StepperOutlet.value), radix:16)
		} else {
			decimalNumber = String(Int(StepperOutlet.value))
		}
		NumberLabelOutlet.text = decimalNumber
	}
	
	@IBAction func RaZAction(_ sender: UIButton) {
		if StepperOutlet.value == 42 {
			NumberLabelOutlet.textColor = UIColor.white
			NumberLabelOutlet.font = UIFont.systemFont(ofSize: 17)
		}
		StepperOutlet.value = 0
		SliderOutlet.value = 0
		UnitsSegmentOutlet.selectedSegmentIndex = 0
		TensSegmentOutlet.selectedSegmentIndex = 0
		NumberLabelOutlet.text = "0"
	}
}

