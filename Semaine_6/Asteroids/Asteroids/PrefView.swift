//
//  PrefView.swift
//  Asteroids
//
//  Created by Robin Blottière--Mayo on 23/11/2018.
//  Copyright © 2018 Robin Blottière--Mayo. All rights reserved.
//

import Foundation
import UIKit

class PrefView : UIView, UIPickerViewDelegate {
	private var difficulty : Difficulty = Difficulty()
	
	private let doneButton : UIButton = UIButton(type: .system)
	private let difficultyLabel : UILabel = UILabel()
	private let difficultyPicker = UIPickerView()

	
	override init(frame: CGRect) {
		super.init(frame: frame)
		self.backgroundColor = UIColor.white
		
		//difficulty = dModel
		difficultyPicker.selectRow(0, inComponent: 0, animated: true)
		
		// Done Button :
		doneButton.setTitle("Done", for: UIControl.State.normal)
		doneButton.tintColor = UIColor.blue
		doneButton.titleLabel?.font = UIFont(name: "System", size: 17.0)
		doneButton.addTarget(self.superview,
							  action: #selector(ViewController.gotoGameView),
							  for: UIControl.Event.touchUpInside)
		self.addSubview(doneButton)
		
		// Difficulty Label :
		difficultyLabel.text = "Select the difficulty level"
		difficultyLabel.textColor = .black
		difficultyLabel.font = UIFont(name: "System", size: 17.0)
		difficultyLabel.textAlignment = NSTextAlignment.center
		self.addSubview(difficultyLabel)
		
		// Difficulty Picker :
		difficultyPicker.backgroundColor = UIColor(red: 1, green: 1, blue: 1,
												   alpha: 0.6)
		difficultyPicker.dataSource = difficulty
		difficultyPicker.delegate = self
		self.addSubview(difficultyPicker)
		
		self.drawInFormat(format: frame.size)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func drawInFormat(format : CGSize) {
		let w = format.width
		let h = format.height
		
		let margine : CGFloat = 30.0
		let elemWidth : CGFloat = margine * 7
		let elemHeight : CGFloat = 30.0

		let pickerWidth : CGFloat = elemWidth * 2
		let pickerHeight : CGFloat = margine * 4
		
		let rightMargine : CGFloat = w - margine
		let distance : CGFloat = 8.0
		
		doneButton.frame = CGRect(x: rightMargine - elemWidth, y: margine,
								  width: elemWidth, height: elemHeight)
		difficultyLabel.frame = CGRect(x: (w / 2) - (elemWidth / 2),
									   y: margine + elemHeight + distance,
									   width: elemWidth, height: elemHeight)
		difficultyPicker.frame = CGRect(x: (w / 2) - (pickerWidth / 2),
										y: (h / 2) - (pickerHeight / 2),
										width: pickerWidth,
										height: pickerHeight)
	}
	
	
	/* ********** UIPickerViewDelegate protocol ********** */
	
	func pickerView(_ pickerView: UIPickerView, titleForRow row: Int,
					forComponent component: Int) -> String? {
		return difficulty.getValue(comp: component, row: row)
	}
	
	func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int,
					inComponent component: Int) {
		let val = difficulty.getValue(comp: component,
									  row:
			pickerView.selectedRow(inComponent: 0))
		print(val)
	}
}
