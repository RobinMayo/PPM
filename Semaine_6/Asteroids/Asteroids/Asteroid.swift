//
//  Asteroid.swift
//  Asteroids
//
//  Created by Robin Blottière--Mayo on 12/11/2018.
//  Copyright © 2018 Robin Blottière--Mayo. All rights reserved.
//

import Foundation
import UIKit

class Asteroid: NSObject {
	private static let a1 = UIImageView(image: UIImage(named: "asteroide-100-1"))
	private static let a2 = UIImageView(image: UIImage(named: "asteroide-100-2"))
	private static let a3 = UIImageView(image: UIImage(named: "asteroide-100-3"))
	private static let a4 = UIImageView(image: UIImage(named: "asteroide-100-4"))
	private static let a21 = UIImageView(image: UIImage(named: "asteroide-120-1"))
	private static let a22 = UIImageView(image: UIImage(named: "asteroide-120-2"))
	private static let a23 = UIImageView(image: UIImage(named: "asteroide-120-3"))
	private static let a24 = UIImageView(image: UIImage(named: "asteroide-120-4"))
	static let asteroidsA : [UIImageView] = [a1, a2, a3, a4, a21, a22, a23, a24]
	var x : CGFloat
	var y : CGFloat
	var w : CGFloat
	var h : CGFloat
	//var currentImage : UIImageView
	
	override init() {
		x = 100
		y = 0
		w = 20
		h = 20
		//currentImage =
			//Asteroid.asteroidsA[Int.random(in: 0...Asteroid.asteroidsA.count)]
	}
}
