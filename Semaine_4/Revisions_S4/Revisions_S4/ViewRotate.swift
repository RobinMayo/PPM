//
//  ViewRotate.swift
//  Revisions_S4
//
//  Created by Robin Blottière--Mayo on 29/08/2019.
//  Copyright © 2019 Robin Blottière--Mayo. All rights reserved.
//

import UIKit

class ViewRotate: UIView {
	let slider : UISlider = UISlider(frame: UIScreen.main.bounds)
	let segementedControl : UISegmentedControl = UISegmentedControl(
		frame: UIScreen.main.bounds)
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		slider.minimumValue = 0
		slider.maximumValue = 2
		slider.setValue(0, animated: true)
		slider.addTarget(self, action: #selector(sliderAction),
						 for: .valueChanged)
		self.addSubview(slider)
		segementedControl.insertSegment(withTitle: "1", at: 0, animated: true)
		segementedControl.insertSegment(withTitle: "2", at: 1, animated: true)
		segementedControl.insertSegment(withTitle: "3", at: 2, animated: true)
		segementedControl.selectedSegmentIndex = 0
		segementedControl.addTarget(self,
									action: #selector(segementedControlAction),
									for: .allEvents)
		self.addSubview(segementedControl)
		draw(frame)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	@objc func sliderAction() {
		segementedControl.selectedSegmentIndex = Int(slider.value)
		slider.value = Float(segementedControl.selectedSegmentIndex)
	}
	
	@objc func segementedControlAction() {
		print("segementedControlAction()")
		slider.value = Float(segementedControl.selectedSegmentIndex)
	}
	
	override func draw(_ rect: CGRect) {
		let w : CGFloat = rect.width
		let h : CGFloat = rect.height
		let margine : CGFloat = 30.0
		let elemW : CGFloat = w / 2
		let elemH : CGFloat = 30.0
		
		if (w < h) {
			segementedControl.frame = CGRect(x: (w / 2) - (elemW / 2),
											 y: margine + elemH,
											 width: elemW, height: elemH)
			slider.frame = CGRect(x: (w / 2) - (elemW / 2),
								  y: (h / 2) - (elemH / 2),
								  width: elemW, height: elemH)
		} else {
			slider.frame = CGRect(x: (w / 2) - (elemW / 2),
								  y: margine + elemH,
								  width: elemW, height: elemH)
			segementedControl.frame = CGRect(x: (w / 2) - (elemW / 2),
											 y: (h / 2) - (elemH / 2),
											 width: elemW, height: elemH)
		}
	}
}
