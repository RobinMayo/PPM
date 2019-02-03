//
//  QATuples.swift
//  Quizz
//
//  Created by Robin Blottière--Mayo on 15/10/2018.
//  Copyright © 2018 Robin Blottière--Mayo. All rights reserved.
//

import Foundation

class QATuples {
	typealias qaTuple = (question : String, answer : String, chuckNorris : Bool, see : Bool)
	let tupleArray : [qaTuple]
	private var _index : Int = 0
	
	init () {
		let q1 = (
			question : "What is the color of Henri IV's horse ?",
			answer : "White",
			chuckNorris : false,
			see : false)
		let q2 = (
			question : "What is the first name of Professor Tournesol ?",
			answer : "Tryphon",
			chuckNorris : false,
			see : false)
		let q3 = (
			question : "Who is the father of Toutânkhamon ?",
			answer : "Akhenaton",
			chuckNorris : false,
			see : false)
		let q4 = (
			question : "Who is the main Caesar's opponent in Rome ?",
			answer : "Brutus",
			chuckNorris : false,
			see : false)
		let q5 = (
			question : """
				What is the name of the third ship of the \"Olimpic\"
				serie created by the White Star Line ?
				""",
			answer : "Britanic",
			chuckNorris : false,
			see : false)
		
		let c1 = (
			question : "Who is the predecessor of Henri IV ?",
			answer : "Jean Ier",
			chuckNorris : true,
			see : false)
		let c2 = (
			question : "What is the first name of capitain Haddock ?",
			answer : "Archibald",
			chuckNorris : true,
			see : false)
		let c3 = (
			question : "Who is the sucessor of Toutânkhamon ?",
			answer : "Aÿ",
			chuckNorris : true,
			see : false)
		let c4 = (
			question : "Who is the last roman empror ?",
			answer : "Romulus Augustus",
			chuckNorris : true,
			see : false)
		let c5 = (
			question : "Whose king of France has the shortest reign ?",
			answer : "Jean Ier",
			chuckNorris : true,
			see : false)
		tupleArray = [q1, c1, q2, c2, q3, c3, q4, c4, q5, c5]
	}
	
	var index : Int {
		get {
			return _index % tupleArray.count
		}
		set {
			if (newValue == -1) {
				_index = tupleArray.count - newValue
			} else {
				_index = newValue % tupleArray.count
			}
		}
	}
	
	func nextNotChuckNorris(localIndex : Int) -> Int {
		var i = localIndex
		repeat {
			i = (i + 1) % tupleArray.count
		} while (tupleArray[i].chuckNorris == true)
		return i
	}
	
	func previousNotChuckNorris(localIndex : Int) -> Int {
		var i = localIndex
		repeat {
			i -= 1
			if (i == -1) {
				i = tupleArray.count - 1
			}
		} while (tupleArray[i].chuckNorris == true)
		return i
	}
}
