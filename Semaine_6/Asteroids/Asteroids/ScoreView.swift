//
//  ScoreView.swift
//  Asteroids
//
//  Created by Robin Blottière--Mayo on 02/02/2019.
//  Copyright © 2019 Robin Blottière--Mayo. All rights reserved.
//

import UIKit

class ScoreView: UIView {
	private var visualEffect : UIVisualEffectView?
	private var label : UILabel = UILabel()
	

	override init(frame: CGRect) {
		super.init(frame: frame)
		self.addSubview(GameView.backgroundImage)
		
		// Blur :
		let blur = UIBlurEffect(style: UIBlurEffect.Style.light)
		visualEffect = UIVisualEffectView(effect: blur)
		visualEffect!.isHidden = false
		self.addSubview(visualEffect!)
		
		// Label :
		label.text = "ScoreView"
		label.textColor = UIColor.black
		label.font = UIFont(name: "System", size: 24.0)
		self.addSubview(label)
		
		self.drawInFormat(format: frame.size)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func drawInFormat(format : CGSize) {
		let w = format.width
		let h = format.height
		
		let margine : CGFloat = 24.0
		let buttonWidth : CGFloat = margine * 4
		let elemHeight : CGFloat = 30.0
		//let distance : CGFloat = 8.0
		
		visualEffect?.frame = CGRect(x: 0, y: 0, width: w, height: h)
		label.frame = CGRect(x: (w / 2) - margine, y: (h / 2) - elemHeight,
							 width: buttonWidth, height: elemHeight)
	}
}
