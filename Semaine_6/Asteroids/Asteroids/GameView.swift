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
	private static let normalFontSize : CGFloat = 17.0
	private static let largeFontSize : CGFloat = 24.0
	private let tieFighterY : CGFloat = UIScreen.main.bounds.height - 60.0
	private let activityIndicator = UIActivityIndicatorView()
	private var astr : [Asteroid] = []
	private var time : Timer = Timer()
	private var score : Int = 0
	
	static let backgroundImage : UIImageView = UIImageView(
		image: UIImage(named: "saturn-rings"))
	let tieFighter : UIImageView = UIImageView(
		image: UIImage(named: "TIE-fighter"))
	
	// Buttons :
	private let playButton : UIButton = UIButton(type: .system)
	private let scoreButton : UIButton = UIButton(type: .system)
	private let prefButton : UIButton = UIButton(type: .system)
	private let exitButton : UIButton = UIButton(type: .system)
	private let leftButton : UIButton = UIButton(type: .system)
	private let rightButton : UIButton = UIButton(type: .system)
	
	// Label :
	private let scoreLabel : UILabel = UILabel()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		self.addSubview(GameView.backgroundImage)
		
		// Activity Indicator :
		activityIndicator.color = UIColor.red
		self.addSubview(activityIndicator)
		
		// Play Button :
		playButton.setTitle("Play", for: .normal)
		playButton.tintColor = UIColor.white
		playButton.titleLabel?.font = UIFont.boldSystemFont(
			ofSize: GameView.largeFontSize)
		playButton.addTarget(self, action: #selector(self.startGame),
							 for: UIControl.Event.touchUpInside)
		self.addSubview(playButton)
		
		// Score Button :
		scoreButton.setTitle("Scores", for: UIControl.State.normal)
		scoreButton.tintColor = UIColor.white
		scoreButton.titleLabel?.font = UIFont(name: "System",
											  size: GameView.normalFontSize)
		scoreButton.addTarget(self.superview,
							  action: #selector(ViewController.gameToScoreView),
							  for: UIControl.Event.touchUpInside)
		self.addSubview(scoreButton)
		
		// Pref Button :
		prefButton.setTitle("Preferences", for: UIControl.State.normal)
		prefButton.tintColor = UIColor.white
		prefButton.titleLabel?.font = UIFont(name: "System",
											 size: GameView.normalFontSize)
		prefButton.addTarget(self.superview,
							 action: #selector(ViewController.gameToPrefView),
							 for: UIControl.Event.touchUpInside)
		self.addSubview(prefButton)
		
		// Exit Button :
		exitButton.setTitle("exit", for: UIControl.State.normal)
		exitButton.tintColor = .white
		exitButton.titleLabel?.font = UIFont(name: "System",
											 size: GameView.normalFontSize)
		exitButton.addTarget(self.superview,
							 action: #selector(exitGame),
							 for: UIControl.Event.touchUpInside)
		
		// Left Button :
		leftButton.setTitle("<<<", for: UIControl.State.normal)
		leftButton.tintColor = UIColor.red
		leftButton.titleLabel?.font = UIFont.boldSystemFont(
			ofSize: GameView.normalFontSize)
		leftButton.addTarget(self.superview,
							 action: #selector(goLeft),
							 for: UIControl.Event.allEvents)
		
		// Right Button :
		rightButton.setTitle(">>>", for: UIControl.State.normal)
		rightButton.tintColor = UIColor.red
		rightButton.titleLabel?.font = UIFont.boldSystemFont(
			ofSize: GameView.normalFontSize)
		rightButton.addTarget(self.superview,
							 action: #selector(goRight),
							 for: UIControl.Event.allEvents)
		
		// Score Label :
		scoreLabel.text = printScore()
		scoreLabel.textAlignment = .center
		scoreLabel.font = UIFont.boldSystemFont(ofSize: GameView.normalFontSize)
		scoreLabel.textColor = .white
		
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
		GameView.backgroundImage.frame = CGRect(x: 0, y: 0,
												width: frame.size.width,
												height: frame.size.height)
		self.drawMenu(format: frame.size)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	@objc func startGame() {
		activityIndicator.startAnimating()
		time = Timer.scheduledTimer(timeInterval: TimeInterval(0.05),
									target: self,
									selector: #selector(self.gameIsOn),
									userInfo: nil, repeats: true)
	}
	
	@objc func exitGame() {
		time.invalidate()
		
		for ast in astr {
			ast.imageView.removeFromSuperview()
		}
		astr.removeAll()
		exitButton.removeFromSuperview()
		leftButton.removeFromSuperview()
		rightButton.removeFromSuperview()
		scoreLabel.removeFromSuperview()
		tieFighter.removeFromSuperview()
		self.addSubview(prefButton)
		self.addSubview(scoreButton)
		self.addSubview(playButton)
		score = 0
		print("The game is off")
		drawMenu(format: frame.size)
	}
	
	@objc func gameIsOn() {
		if activityIndicator.isAnimating {
			let asteroid = Asteroid()
			self.addSubview(asteroid.imageView)
			astr.append(asteroid)
			playButton.removeFromSuperview()
			scoreButton.removeFromSuperview()
			prefButton.removeFromSuperview()
			self.addSubview(exitButton)
			self.addSubview(scoreLabel)
			self.addSubview(leftButton)
			self.addSubview(rightButton)
			self.addSubview(tieFighter)
			activityIndicator.stopAnimating()
			tieFighter.frame.origin.x = (UIScreen.main.bounds.width / 2) -
				(30.0 / 2)
			tieFighter.frame.origin.y = tieFighterY
			print("The game is on")
		}
		// Chance a new asteroid appear :
		if Int.random(in: 0...1_000) > 960 {
			let asteroid = Asteroid()
			self.addSubview(asteroid.imageView)
			astr.append(asteroid)
		}
		drawGame(format: frame.size)
	}
	
	@objc func goLeft() {
		let w : CGFloat = CGFloat(UIScreen.main.bounds.width)
		let x : CGFloat = tieFighter.frame.origin.x - 5.0
		if x < 0 {
			tieFighter.frame.origin.x = w + x
		} else {
			tieFighter.frame.origin.x = x
		}
	}
	
	@objc func goRight() {
		let w : CGFloat = CGFloat(UIScreen.main.bounds.width)
		tieFighter.frame.origin.x = (tieFighter.frame.origin.x + 5.0)
			.truncatingRemainder(dividingBy: w)
	}
	
	func drawMenu(format : CGSize) {
		let w = format.width
		let h = format.height
		
		let margine : CGFloat = 30.0
		let elemWidth : CGFloat = margine * 4
		let rightMargine : CGFloat = w - margine
		let elemHeight : CGFloat = 30.0
		let distance : CGFloat = 8.0
		
		scoreButton.frame = CGRect(x: margine + distance, y: margine,
								   width: elemWidth, height: elemHeight)
		
		prefButton.frame = CGRect(x: rightMargine - elemWidth, y: margine,
								  width: elemWidth, height: elemHeight)
		
		playButton.frame = CGRect(x: (w / 2) - (elemWidth / 2), y: h / 3,
								  width: elemWidth, height: elemHeight)
		
		// Activity Indicator :
		activityIndicator.frame = CGRect(x: w / 2, y: h / 2,
										 width: 20, height: 20)
	}
	
	func drawGame(format : CGSize) {
		let w = format.width
		let h = format.height
		
		let margine : CGFloat = 30.0
		let elemWidth : CGFloat = margine * 4
		let rightMargine : CGFloat = w - margine
		let elemHeight : CGFloat = 30.0
		let tieWidth : CGFloat = 30.0
		let tieHeight : CGFloat = 30.0
		
		exitButton.frame = CGRect(x: (w / 2) - (elemWidth / 2),
								  y: margine,
								  width: elemWidth, height: elemHeight)
		leftButton.frame = CGRect(x: margine, y: h - (margine + elemHeight),
								  width: elemWidth, height: elemHeight)
		rightButton.frame = CGRect(x: rightMargine - elemWidth,
								   y: h - (margine + elemHeight),
								   width: elemWidth, height: elemHeight)
		tieFighter.frame = CGRect(x: tieFighter.frame.origin.x, y: tieFighterY,
								  width: tieWidth, height: tieHeight)
		for ast in astr {
			ast.x += ast.lateralDeviation
			ast.y += ast.fallSpeed
			ast.rotationAngle += ast.rotation
			ast.imageView.transform = CGAffineTransform(
				rotationAngle: ast.rotationAngle)
			
			if ast.y >= h {
				ast.imageView.removeFromSuperview()
				
				if let index : Int = astr.index(of: ast) {
					astr.remove(at: index)
					score += 1
				}
			} else {
				ast.imageView.frame = CGRect(x: ast.x, y: ast.y,
											 width: ast.w, height: ast.h)
				
				if collision(ofAsteroidFrame: ast.imageView.frame,
							 withTieFighterFrame: tieFighter.frame) {
					exitGame()
				}
			}
		}
		scoreLabel.text = printScore()
		scoreLabel.frame = CGRect(x: rightMargine - elemWidth,
								  y: margine,
								  width: elemWidth, height: elemHeight)
	}
	
	func collision(ofAsteroidFrame asteroid : CGRect,
				   withTieFighterFrame tie : CGRect) -> Bool {
		let ignoringSpace : CGFloat = 2.0
		let tieMinX : CGFloat = tie.minX + ignoringSpace
		let tieMinY : CGFloat = tie.minY + ignoringSpace
		let tieMaxX : CGFloat = tie.maxX - ignoringSpace
		let tieMaxY : CGFloat = tie.maxY - ignoringSpace
		let asteroidIsOnTheLeft : Bool 	= asteroid.maxX < tieMinX
		let asteroidIsOnTheRight : Bool = asteroid.minX > tieMaxX
		let asteroidIsOnTheTop : Bool 	= asteroid.maxY > tieMinY
		let asteroidIsBelow : Bool 		= asteroid.minY < tieMaxY
		let asteroidIsOnTieLine : Bool =
			(asteroid.minY >= tieMinY && asteroid.minY <= tieMaxY) ||
			(asteroid.maxY >= tieMinY && asteroid.maxY <= tieMaxY)
		let asteroidIsOnTieColumn : Bool =
			(asteroid.minX >= tieMinX && asteroid.minX <= tieMaxX) ||
			(asteroid.maxX >= tieMinX && asteroid.maxX <= tieMaxX)
		
		if asteroidIsOnTieLine {
//			print("asteroidIsOnTieLine : \(asteroidIsOnTieLine)")
//			print("asteroid : \(asteroid.minX), \(asteroid.minY), \(asteroid.maxX), \(asteroid.maxY) "
//				+ "tie : \(tieMinX), \(tieMinY), \(tieMaxX), \(tieMaxY)")
			return !(asteroidIsOnTheRight || asteroidIsOnTheLeft)
		} else if asteroidIsOnTieColumn {
//			print("asteroidIsOnTieColumn : \(asteroidIsOnTieColumn)")
//			print("asteroid : \(asteroid.minX), \(asteroid.minY), \(asteroid.maxX), \(asteroid.maxY) "
//				+ "tie : \(tieMinX), \(tieMinY), \(tieMaxX), \(tieMaxY)")
			return !(asteroidIsOnTheTop || asteroidIsBelow)
		}
		return false
	}
	
	func printScore() -> String {
		return "Score : \(score)"
	}
}
