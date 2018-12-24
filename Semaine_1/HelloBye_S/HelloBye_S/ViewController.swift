//
//  ViewController.swift
//  Bonrevoir_S
//
//  Created by Robin Blottière--Mayo on 28/08/2018.
//  Copyright © 2018 Robin Blottière--Mayo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	var bonjour = true
	var initialisation = true
	
	@IBOutlet weak var BonjourLabel: UILabel!
	@IBOutlet weak var BonjourButton: UIButton!
	
	@IBAction func BonjourActionButton(_ sender: Any) {
		if initialisation {
			BonjourLabel.text = "Hello"
			BonjourButton.setTitle("SayBye", for: UIControl.State.normal)
			initialisation = false
		}
		else {
			if bonjour {
				BonjourLabel.text = "Bye bye"
				BonjourButton.setTitle("SayHello", for: UIControl.State.normal)
				bonjour = false
			}
			else {
				BonjourLabel.text = "Hello"
				BonjourButton.setTitle("SayBye", for: UIControl.State.normal)
				bonjour = true
			}
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
}
