//
//  Questions.swift
//  Quizz
//
//  Created by Robin Blottière--Mayo on 14/10/2018.
//  Copyright © 2018 Robin Blottière--Mayo. All rights reserved.
//

import Foundation

class Questions : NSObject {
	let questionsArray : [QuestionAnswer]
	private var _index : Int = 0
	
	override init () {
		let q1 = QuestionAnswer(
			question : "What is the color of Henri IV's horse ?",
			answer : "White",
			chuckNorris : false)
		let q2 = QuestionAnswer(
			question : "What is the first name of Professor Tournesol ?",
			answer : "Tryphon",
			chuckNorris : false)
		let q3 = QuestionAnswer(
			question : "Who is the father of Toutânkhamon ?",
			answer : "Akhenaton",
			chuckNorris : false)
		let q4 = QuestionAnswer(
			question : "Who is the main Caesar's opponent in Rome ?",
			answer : "Brutus",
			chuckNorris : false)
		let q5 = QuestionAnswer(
			question : """
				What is the name of the third ship of the \"Olimpic\"
				serie created by the White Star Line ?
				""",
			answer : "Britanic",
			chuckNorris : false)
		
		let c1 = QuestionAnswer(
			question : "Who is the predecessor of Henri IV ?",
			answer : "Jean Ier",
			chuckNorris : true)
		let c2 = QuestionAnswer(
			question : "What is the first name of capitain Haddock ?",
			answer : "Archibald",
			chuckNorris : true)
		let c3 = QuestionAnswer(
			question : "Who is the sucessor of Toutânkhamon ?",
			answer : "Aÿ",
			chuckNorris : true)
		let c4 = QuestionAnswer(
			question : "Who is the last roman empror ?",
			answer : "Romulus Augustus",
			chuckNorris : true)
		let c5 = QuestionAnswer(
			question : "Whose king of France has the shortest reign ?",
			answer : "Jean Ier",
			chuckNorris : true)
		questionsArray = [q1, c1, q2, c2, q3, c3, q4, c4, q5, c5]
	}
	
	var index : Int {
		get {
			return _index % questionsArray.count
		}
		set {
			if (newValue == -1) {
				_index = questionsArray.count + newValue
			} else {
				_index = newValue % questionsArray.count
			}
		}
	}
	
	func nextNotChuckNorris(localIndex : Int) -> Int {
		var i = localIndex
		repeat {
			i = (i + 1) % questionsArray.count
		} while (questionsArray[i].isChuckNorris == true)
		return i
	}
	
	func previousNotChuckNorris(localIndex : Int) -> Int {
		var i = localIndex
		repeat {
			i -= 1
			if (i == -1) {
				i = questionsArray.count - 1
			}
		} while (questionsArray[i].isChuckNorris == true)
		return i
	}
}
