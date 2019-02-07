//
//  MapView.swift
//  Me&Map
//
//  Created by Robin Blottière--Mayo on 26/12/2018.
//  Copyright © 2018 Robin Blottière--Mayo. All rights reserved.
//

import UIKit


class MapViewController: UIViewController {
	private let mapView = MapView(frame: UIScreen.main.bounds)
	
	init() {
		super.init(nibName: nil, bundle: nil)
		print("Map View Controller - init()")

		let earthImage = UIImage(named: "earth")
		let tabBarItem = UITabBarItem(title: "Map", image: earthImage, tag: 1)
		self.tabBarItem = tabBarItem
		self.title = "Map & Locations"
		self.view = mapView
		//self.viewDidLoad()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		print("Map View Controller - viewDidLoad()")
		
		self.view.backgroundColor = UIColor.yellow
		self.drawInSize(UIScreen.main.bounds.size)
	}
	
	func drawInSize(_ size: CGSize) {}
	
	override func viewWillTransition(to size: CGSize, with coordinator:
			UIViewControllerTransitionCoordinator) {
		print("Map View Controller - viewWillTransition()")
		self.drawInSize(size)
	}
}
