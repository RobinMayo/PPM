//
//  GameView.swift
//  Asteroids
//
//  Created by Robin Blottière--Mayo on 12/11/2018.
//  Copyright © 2018 Robin Blottière--Mayo. All rights reserved.
//

import Foundation
import UIKit

class GameView : UIView {
	let MAX_ASTEROIDS = 3
	private let activityIndicator = UIActivityIndicatorView()

	private var rd : Int = 0
	//var astr : [Asteroid] = []
	
	static let backgroundImage : UIImageView = UIImageView(
		image: UIImage(named: "saturn-rings"))
	
	private let playButton : UIButton = UIButton(type: .system)
	private let scoreButton : UIButton = UIButton(type: .system)
	private let prefButton : UIButton = UIButton(type: UIButton.ButtonType.system)

	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		self.addSubview(GameView.backgroundImage)
		
		// Activity Indicator :
		activityIndicator.color = UIColor.red
		self.addSubview(activityIndicator)
		
		// Play Button :
		playButton.setTitle("Play", for: .normal)
		playButton.tintColor = UIColor.white
		playButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24.0)
		playButton.addTarget(self, action: #selector(self.startAndStop),
							 for: UIControl.Event.touchUpInside)
		self.addSubview(playButton)
		
		// Score Button :
		scoreButton.setTitle("Scores", for: UIControl.State.normal)
		scoreButton.tintColor = UIColor.white
		scoreButton.titleLabel?.font = UIFont(name: "System", size: 17.0)
		scoreButton.addTarget(self.superview,
							  action: #selector(ViewController.gameToScoreView),
							  for: UIControl.Event.touchUpInside)
		self.addSubview(scoreButton)
		
		// Pref Button :
		prefButton.setTitle("Preferences", for: UIControl.State.normal)
		prefButton.tintColor = UIColor.white
		prefButton.titleLabel?.font = UIFont(name: "System", size: 17.0)
		prefButton.addTarget(self.superview,
							  action: #selector(ViewController.gameToPrefView),
							  for: UIControl.Event.touchUpInside)
		self.addSubview(prefButton)
		
		// Motion effect :
		let effectV = UIInterpolatingMotionEffect(keyPath: "center.x",
												  type: .tiltAlongHorizontalAxis)
		effectV.minimumRelativeValue = -20.0
		effectV.maximumRelativeValue = 20.0
		
		let effectH = UIInterpolatingMotionEffect(keyPath: "center.y",
												  type: .tiltAlongVerticalAxis)
		effectH.minimumRelativeValue = -20.0
		effectH.maximumRelativeValue = 20.0
		
		GameView.backgroundImage.addMotionEffect(effectV)
		GameView.backgroundImage.addMotionEffect(effectH)
		
		rd = Int.random(in: 0...100)
		//astr.append(Asteroid())
		self.drawInFormat(format: frame.size)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	@objc func startAndStop() {
		if activityIndicator.isAnimating {
			activityIndicator.stopAnimating()
		} else {
			activityIndicator.startAnimating()
		}
	}
	
	func drawInFormat(format : CGSize) {
		let w = format.width
		let h = format.height
		//print("\(time)\n")
		
		let margine : CGFloat = 30.0
		let buttonWidth : CGFloat = margine * 4
		let rightMargine : CGFloat = w - margine
		let elemHeight : CGFloat = 30.0
		let distance : CGFloat = 8.0
		
		/*
		astr[0].currentImage.frame =
			CGRect(x: astr[0].x,
				   y: (astr[0].y + 1).truncatingRemainder(dividingBy: h),
				   width: astr[0].w, height: astr[0].h)
		*/
		GameView.backgroundImage.frame = CGRect(x: 0, y: 0, width: w, height: h)
		scoreButton.frame = CGRect(x: margine + distance, y: margine,
								   width: buttonWidth, height: elemHeight)
		
		prefButton.frame = CGRect(x: rightMargine - buttonWidth, y: margine,
								  width: buttonWidth, height: elemHeight)
		
		playButton.frame = CGRect(x: (w / 2) - (buttonWidth / 2), y: h / 3,
								  width: buttonWidth, height: elemHeight)
		
		// Activity Indicator :
		activityIndicator.frame = CGRect(x: w / 2, y: h / 2,
										 width: 20, height: 20)
	}
}
