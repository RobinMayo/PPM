//
//  ViewController.swift
//  Quizz_GS
//
//  Created by Robin Blottière--Mayo on 24/10/2018.
//  Copyright © 2018 Robin Blottière--Mayo. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
	let _questionsArray : Questions = Questions()
	let v : View = View(frame : UIScreen.main.bounds)
	var nbAnswerSeen : Int = 0
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.view = v
		v.questionLabel.text = _questionsArray.questionsArray[0].question
		v.backgroundColor = UIColor.black
	}
	
	override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
		super.viewWillTransition(to: size, with: coordinator)
		let v = self.view as! View
		v.drawInFormat(format : size)
	}
	
	@objc func buttonAction(_ sender: UIButton) {
		
		// Chuck Norris mode is on :
		if (v.chuckSwitch.isOn) {
			_questionsArray.index = _questionsArray.index + sender.tag
			print("_questionsArray.index : \(_questionsArray.index)")
			v.questionLabel.text = _questionsArray.questionsArray[_questionsArray.index].question
			
			if (_questionsArray.questionsArray[_questionsArray.index].isChuckNorris) {
				v.questionLabel.textColor = UIColor.red
			} else {
				v.questionLabel.textColor = UIColor.blue
			}
		}
			// Chuck Norris mode is off :
		else {
			if (sender.tag == 1) {
				_questionsArray.index = _questionsArray.nextNotChuckNorris(localIndex : _questionsArray.index)
			} else {
				_questionsArray.index = _questionsArray.previousNotChuckNorris(localIndex : _questionsArray.index)
			}
			v.questionLabel.text = _questionsArray.questionsArray[_questionsArray.index].question
		}
		// Answer
		if (_questionsArray.questionsArray[_questionsArray.index].see) {
			v.answerLabel.text = _questionsArray.questionsArray[_questionsArray.index].answer
		} else {
			v.answerLabel.text = ""
		}
		v.setNeedsDisplay()
	}
	
	@objc func answerButtonAction(_ sender: UIButton) {
		if (_questionsArray.questionsArray[_questionsArray.index].see == false) {
			nbAnswerSeen += 1
			_questionsArray.questionsArray[_questionsArray.index].see = true
			v.answersSeenLabel.text = "Answer seen : \(nbAnswerSeen)"
			v.answerLabel.text = _questionsArray.questionsArray[_questionsArray.index].answer
		} else {
			v.answerLabel.text = _questionsArray.questionsArray[_questionsArray.index].answer
		}
		v.setNeedsDisplay()
	}
	
	@objc func switchAction(_ sender: Any) {
		if (v.chuckSwitch.isOn == false &&
			_questionsArray.questionsArray[_questionsArray.index].isChuckNorris) {
			_questionsArray.index = _questionsArray.nextNotChuckNorris(localIndex : _questionsArray.index)
			v.questionLabel.text = _questionsArray.questionsArray[_questionsArray.index].question
			v.answerLabel.text = ""
			v.questionLabel.textColor = UIColor.blue
		}
		v.setNeedsDisplay()
	}
}
