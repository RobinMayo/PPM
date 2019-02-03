//
//  QuestionAnswer.swift
//  Quizz
//
//  Created by Robin Blottière--Mayo on 14/10/2018.
//  Copyright © 2018 Robin Blottière--Mayo. All rights reserved.
//

import Foundation

class QuestionAnswer {
	var see : Bool = false
	let chuckNorris : Bool
	let question : String
	private let _answer : String
	
	init (question : String, answer : String, chuckNorris : Bool) {
		self.question = question
		self._answer = answer
		self.chuckNorris = chuckNorris
	}
	
	var answer : String {
		get {
			see = true
			return _answer
		}
	}
}
