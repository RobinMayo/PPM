//
//  Difficulty.swift
//  Asteroids
//
//  Created by Robin Blottière--Mayo on 24/11/2018.
//  Copyright © 2018 Robin Blottière--Mayo. All rights reserved.
//

import Foundation
import UIKit

class Difficulty: NSObject, UIPickerViewDataSource {
	private let difficultyLevel : [String] = ["Beiginner", "Novice", "Pilot",
											  "Commander", "Jedi"]
	
	func getDifficultyLevel(comp: Int) -> String {
		switch comp {
		case 0: return difficultyLevel[0]
		case 1: return difficultyLevel[1]
		case 2: return difficultyLevel[2]
		case 3: return difficultyLevel[3]
		case 4: return difficultyLevel[4]
		default: return difficultyLevel[2]
		}
	}
	
	func getValue(comp: Int, row: Int) -> String {
		if comp == 0 && row < difficultyLevel.count {
			return difficultyLevel[row]
		} else {
			return "- ERROR -"
		}
	}
	
	func pickerView(_ pickerView: UIPickerView,
					numberOfRowsInComponent componnent: Int) -> Int {
		if componnent == 0 {
			return difficultyLevel.count
		} else {
			return 0
		}
	}
	
	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return 1;
	}
}
