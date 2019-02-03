//
//  ViewController.swift
//  Quizz
//
//  Created by Robin Blottière--Mayo on 30/09/2018.
//  Copyright © 2018 Robin Blottière--Mayo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	let _questionsArray : Questions = Questions()
	var nbAnswerSeen : Int = 0
	
	override func viewDidLoad() {
		super.viewDidLoad()
		questionLabelOutlet.text = _questionsArray.questionsArray[0].question
	}

	@IBOutlet weak var switchOutlet: UISwitch!
	
	@IBOutlet weak var questionLabelOutlet: UILabel!
	
	@IBOutlet weak var answerLabelOutlet: UILabel!
	
	@IBOutlet weak var answersSeenOutlet: UILabel!
	
	@IBAction func buttonAction(_ sender: UIButton) {
		// Chuck Norris mode is on :
		if (switchOutlet.isOn) {
			_questionsArray.index = _questionsArray.index + sender.tag
			questionLabelOutlet.text = _questionsArray.questionsArray[_questionsArray.index].question
			
			if (_questionsArray.questionsArray[_questionsArray.index].chuckNorris) {
				questionLabelOutlet.textColor = UIColor.red
			} else {
				questionLabelOutlet.textColor = UIColor.blue
			}
		}
		// Chuck Norris mode is off :
		else {
			if (sender.tag == 1) {
				_questionsArray.index = _questionsArray.nextNotChuckNorris(localIndex : _questionsArray.index)
			} else {
				_questionsArray.index = _questionsArray.previousNotChuckNorris(localIndex : _questionsArray.index)
			}
			questionLabelOutlet.text = _questionsArray.questionsArray[_questionsArray.index].question
		}
		// Answer
		if (_questionsArray.questionsArray[_questionsArray.index].see) {
			answerLabelOutlet.text = _questionsArray.questionsArray[_questionsArray.index].answer
		} else {
			answerLabelOutlet.text = ""
		}
	}
	
	@IBAction func answerButtonAction(_ sender: Any) {
		if (_questionsArray.questionsArray[_questionsArray.index].see == false) {
			nbAnswerSeen += 1
			_questionsArray.questionsArray[_questionsArray.index].see = true
			answersSeenOutlet.text = "Answer seen : \(nbAnswerSeen)"
			answerLabelOutlet.text = _questionsArray.questionsArray[_questionsArray.index].answer
		} else {
			answerLabelOutlet.text = _questionsArray.questionsArray[_questionsArray.index].answer
		}
	}
	
	@IBAction func switchAction(_ sender: Any) {
		if (switchOutlet.isOn == false && _questionsArray.questionsArray[_questionsArray.index].chuckNorris) {
			_questionsArray.index = _questionsArray.nextNotChuckNorris(localIndex : _questionsArray.index)
			questionLabelOutlet.text = _questionsArray.questionsArray[_questionsArray.index].question
			answerLabelOutlet.text = ""
			questionLabelOutlet.textColor = UIColor.blue
		}
	}
}
