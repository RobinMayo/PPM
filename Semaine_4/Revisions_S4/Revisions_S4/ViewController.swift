//
//  ViewController.swift
//  Revisions_S4
//
//  Created by Robin Blottière--Mayo on 29/08/2019.
//  Copyright © 2019 Robin Blottière--Mayo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		self.view = ViewRotate()
	}
	
	override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
		super.viewWillTransition(to: size, with: coordinator)
		view.draw(size)
	}
}

