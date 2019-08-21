//
//  ViewController.swift
//  Asteroids
//
//  Created by Robin Blottière--Mayo on 11/11/2018.
//  Copyright © 2018 Robin Blottière--Mayo. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
	var gameV : GameView = GameView(frame: UIScreen.main.bounds)
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.view = gameV
		self.becomeFirstResponder()
	}
	
	override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
		super.viewWillTransition(to: size, with: coordinator)
		
		if((self.view as? GameView) != nil) {
			(self.view as! GameView).drawMenu(format: size)
		} else if((self.view as? ScoreView) != nil) {
			(self.view as! ScoreView).drawInFormat(format: size)
		}
		self.view.frame = CGRect(x: 0, y: 0,
								 width: size.width, height: size.height)
	}
	
	@objc func gotoGameView() {
		let gameV = GameView(frame: UIScreen.main.bounds)
		self.view = gameV
	}
	
	@objc func gameToScoreView() {
		let scoreV = ScoreView(frame: UIScreen.main.bounds)
		self.view = scoreV
	}
	
	@objc func gameToPrefView() {
		let prefV = PrefView(frame: UIScreen.main.bounds)
		self.view = prefV
	}
}
