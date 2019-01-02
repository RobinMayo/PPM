//
//  ViewController.swift
//  Couleur_S
//
//  Created by Robin Blottière--Mayo on 02/09/2018.
//  Copyright © 2018 Robin Blottière--Mayo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	@IBOutlet weak var ColorView: UIView!
	@IBOutlet weak var ChangeColorStepperOutlet: UIStepper!
	
	@IBAction func ChangeColorStepper(_ sender: Any) {
		switch ChangeColorStepperOutlet.value {
		case 0.0:
			ColorView.backgroundColor = UIColor.yellow
		case 1.0:
			ColorView.backgroundColor = UIColor.red
		case 2.0:
			ColorView.backgroundColor = UIColor.green
		case 3.0:
			ColorView.backgroundColor = UIColor.blue
		case 4.0:
			ColorView.backgroundColor = UIColor.black
		case 5.0:
			ColorView.backgroundColor = UIColor.cyan
		case 6.0:
			ColorView.backgroundColor = UIColor.magenta
		default:
			ColorView.backgroundColor = UIColor.yellow
		}
	}
}
