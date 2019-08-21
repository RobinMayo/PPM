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
	private static let i1 = UIImage(named: "asteroide-100-1")
	private static let i2 = UIImage(named: "asteroide-100-2")
	private static let i3 = UIImage(named: "asteroide-100-3")
	private static let i4 = UIImage(named: "asteroide-100-4")
	private static let i21 = UIImage(named: "asteroide-120-1")
	private static let i22 = UIImage(named: "asteroide-120-2")
	private static let i23 = UIImage(named: "asteroide-120-3")
	private static let i24 = UIImage(named: "asteroide-120-4")
	private static let asteroidsTypes : [UIImage?] = [i1, i2, i3, i4, i21, i22,
													  i23, i24]
	public override var description: String {
		let imageName = imageView.image?.description
		return "currentImage: \(imageName ?? "imageNotFound") " +
		"coordinates are (x, y, w, h) : \(x), \(y), \(w), \(h)."
	}
	var x : CGFloat
	var y : CGFloat
	var w : CGFloat
	var h : CGFloat
	let fallSpeed : CGFloat
	let lateralDeviation : CGFloat
	var rotationAngle : CGFloat
	let rotation : CGFloat
	var imageView : UIImageView
	
	override init() {
		x = CGFloat.random(in: 0.0...UIScreen.main.bounds.width)
		y = 0
		w = 20
		h = 20
		fallSpeed = CGFloat.random(in: 0.5...3)
		lateralDeviation = CGFloat.random(in: -2.0...2.0)
		rotation = CGFloat.random(in: -0.1...0.1)
		rotationAngle = 0
		let imageIndex = Int.random(in: 0...Asteroid.asteroidsTypes.count - 1)
		let image = Asteroid.asteroidsTypes[imageIndex]
		imageView = UIImageView(image: image)
	}
}
