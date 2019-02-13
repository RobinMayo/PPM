//
//  View.swift
//  Quizz_GS
//
//  Created by Robin Blottière--Mayo on 24/10/2018.
//  Copyright © 2018 Robin Blottière--Mayo. All rights reserved.
//

import Foundation
import UIKit

class View : UIView {
	let device : UIDevice = UIDevice.current
	let leftImage = UIImage(named: "left")
	let rightImage = UIImage(named: "right")
	let maxQuestionLines = 4
	
	var leftButton = UIButton(type: .custom)
	var rightButton = UIButton(type: .custom)
	var answerButton = UIButton(type: .system)
	var theQuestionLabel = UILabel()
	var questionLabel = UILabel()
	var theAnswerLabel = UILabel()
	var answerLabel = UILabel()
	var chuckNorrisLabel = UILabel()
	var answersSeenLabel = UILabel()
	var chuckSwitch = UISwitch()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		// Left Button :
		leftButton.setImage(leftImage, for: UIControl.State.normal)
		leftButton.tag = -1;
		self.addSubview(leftButton)
		leftButton.addTarget(self.subviews, action:
			#selector(ViewController.buttonAction(_:)), for: .touchUpInside)
		
		// Right Button :
		rightButton.setImage(rightImage, for: UIControl.State.normal)
		rightButton.tag = 1;
		rightButton.addTarget(self.subviews, action:
			#selector(ViewController.buttonAction(_:)), for: .touchUpInside)
		self.addSubview(rightButton)
		
		// Answer Button :
		answerButton.setTitle("The answer", for: .normal)
		answerButton.titleLabel?.textColor = UIColor.blue
		answerButton.titleLabel?.font = UIFont(name: "System", size: 17)
		answerButton.addTarget(self.subviews, action:
			#selector(ViewController.answerButtonAction(_:)), for: .touchUpInside)
		self.addSubview(answerButton)

		// The question Label :
		theQuestionLabel.text = "The question"
		theQuestionLabel.textAlignment = NSTextAlignment.center
		theQuestionLabel.textColor = UIColor.white
		self.addSubview(theQuestionLabel)
		
		// Question Label :
		questionLabel.text = "?"
		questionLabel.textAlignment = NSTextAlignment.center
		questionLabel.textColor = UIColor.blue
		questionLabel.lineBreakMode = .byWordWrapping
		questionLabel.numberOfLines = maxQuestionLines
		self.addSubview(questionLabel)
		
		// The answer Label :
		theAnswerLabel.text = "The answer"
		theAnswerLabel.textAlignment = NSTextAlignment.center
		theAnswerLabel.textColor = UIColor.white
		self.addSubview(theAnswerLabel)
		
		// Answer Label :
		answerLabel.text = "-"
		answerLabel.textAlignment = NSTextAlignment.center
		answerLabel.textColor = UIColor.green
		self.addSubview(answerLabel)
		
		// Chuck Norris mode Label :
		chuckNorrisLabel.text = "CHuck Norris mode"
		chuckNorrisLabel.textAlignment = NSTextAlignment.right
		chuckNorrisLabel.textColor = UIColor.white
		self.addSubview(chuckNorrisLabel)
		
		// Answer Seen Label :
		answersSeenLabel.text = "Answers seen : 0"
		answersSeenLabel.textColor = UIColor.white
		self.addSubview(answersSeenLabel)
		
		// Chuck Switch :
		chuckSwitch.addTarget(self.subviews, action:
			#selector(ViewController.switchAction(_:)), for: .allTouchEvents)
		self.addSubview(chuckSwitch)
		
		self.drawInFormat(format: frame.size)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func drawInFormat(format : CGSize) {
		let h = format.height
		let w = format.width
		
		let margine : CGFloat = 24.0
		let rightMargine : CGFloat = w - margine
		let elemHeight : CGFloat = 28.0
		let distance : CGFloat = 8.0
		
		// Origin for each elements aligne with the left margine.
		var originX : CGFloat
		var originY : CGFloat = self.safeAreaInsets.top
		var elemWidth : CGFloat


		/* ********** First Line : ********** */
		
		let buttonHeight : CGFloat = 40.0
		let buttonWidth : CGFloat = 40.0
		
		// Left Button :
		leftButton.frame = CGRect(x: margine, y: margine, width: buttonWidth,
								  height: buttonHeight)
		
		// Right Button :
		originX = rightMargine - 40
		rightButton.frame = CGRect(x: originX, y: margine, width: buttonWidth,
								   height: buttonHeight)
		
		// Answer Button :
		originX = margine + leftButton.frame.width
		elemWidth = format.width - (2 * (margine + rightButton.frame.width))
		answerButton.frame = CGRect(x: originX, y: margine, width: elemWidth,
									height: buttonHeight)
		
		
		/* ********** Centrale Zone : ********** */

		elemWidth = w - (2 * margine)
		
		// The question Label :
		originY = leftButton.frame.origin.y + leftButton.frame.size.height + distance
		theQuestionLabel.frame = CGRect(x: margine, y: originY, width: elemWidth,
									 height: elemHeight)
		
		// Question Label :
		originY = theQuestionLabel.frame.origin.y + theQuestionLabel.frame.size.height + distance
		questionLabel.frame = CGRect(x: margine, y: originY, width: elemWidth,
										height: elemHeight * CGFloat(maxQuestionLines))
		
		// The answer Label :
		originY = questionLabel.frame.origin.y + questionLabel.frame.size.height + distance
		theAnswerLabel.frame = CGRect(x: margine, y: originY, width: elemWidth,
									 height: elemHeight)
		
		// Answer Label :
		originY = theAnswerLabel.frame.origin.y + theAnswerLabel.frame.size.height + distance
		answerLabel.frame = CGRect(x: margine, y: originY, width: elemWidth,
									  height: elemHeight)
		
		
		/* ********** Bottom Zone : ********** */
		
		// Chuck Norris mode Label :
		chuckNorrisLabel.text = "CHuck Norris mode"
		
		// Answer Seen Label :
		originY = h - (margine + elemHeight)
		answersSeenLabel.frame = CGRect(x: margine, y: originY,
										width: elemWidth / 2, height: elemHeight)
		
		// Chuck Switch :
		let switchWidth : CGFloat = 50
		let switchHeight : CGFloat = 30
		let switchOriginX : CGFloat = w - (switchWidth + margine)
		let switchOriginY : CGFloat = h - (switchHeight + margine)
		chuckSwitch.frame = CGRect(x: switchOriginX, y: switchOriginY,
								   width: switchWidth, height: switchHeight)
		
		// Chuck Norris mode Label :
		let chuckLabelOriginY : CGFloat = chuckSwitch.frame.origin.y - (distance + elemHeight)
		chuckNorrisLabel.frame = CGRect(x: margine, y: chuckLabelOriginY,
								   width: elemWidth, height: elemHeight)
	}
}
