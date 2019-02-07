//
//  MapView.swift
//  Me&Map
//
//  Created by Robin Blottière--Mayo on 07/01/2019.
//  Copyright © 2019 Robin Blottière--Mayo. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class MapView: UIView, UITextFieldDelegate, MKMapViewDelegate,
		CLLocationManagerDelegate {
	
	private let textField = UITextField()
	private let locManager : CLLocationManager = CLLocationManager()
	private let map = MKMapView()
	private let mapMode =
		UISegmentedControl(items: ["Map", "Satellite", "Hybrid"])
	private var cam : MKMapCamera?
	
	override init(frame: CGRect) {
		super.init(frame: frame)

		// UITextField :
		textField.backgroundColor = UIColor(red: 0.98, green: 0.94, blue: 0.54,
											alpha: 1)
		textField.borderStyle = .roundedRect
		textField.keyboardType = .webSearch
		textField.delegate = self
		textField.textColor = .black
		//textField.font = UIFont.systemFont(ofSize: 20)
		self.addSubview(textField)
		
		// Map :
		map.isScrollEnabled = true
		map.isZoomEnabled = true
		map.delegate = self
		self.addSubview(map)
		
		// Map mode :
		mapMode.backgroundColor = UIColor.white
		mapMode.tintColor = UIColor.black
		mapMode.selectedSegmentIndex = 1
		map.mapType = .satellite
		mapMode.addTarget(self, action: #selector(changeMap(sender:)),
						  for: .valueChanged)
		self.addSubview(mapMode)
		
		self.drawInSize(frame.size)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	/* Map : */
	
	@objc func changeMap(sender: UISegmentedControl) {
		switch sender.selectedSegmentIndex {
		case 0:
			map.mapType = .standard
		case 1:
			if cam == nil {
				map.mapType = .satellite
			} else {
				map.mapType = .satelliteFlyover
			}
		case 2:
			if cam == nil {
				map.mapType = .hybrid
			} else {
				map.mapType = .hybridFlyover
			}
		default:
			map.mapType = .standard
		}
	}
	
	@objc func goThere() {
		print("Map View - goThere()")

		let lat : Double = (locManager.location?.coordinate.latitude)!
		let lon : Double = (locManager.location?.coordinate.longitude)!
		let alt : Double = 50
		let ori : Double = 120
		
		let location = CLLocationCoordinate2D(latitude: lat, longitude: lon)
		let viewPoint = CLLocationCoordinate2D(latitude: lat - 0.01,
											   longitude: lon)
		let span = MKCoordinateSpan(latitudeDelta: 3, longitudeDelta: 3)
		map.setRegion(MKCoordinateRegion(center: location, span: span),
					  animated: true)
		map.showsBuildings = true
		cam = MKMapCamera(lookingAtCenter: location,
						  fromEyeCoordinate: viewPoint, eyeAltitude: alt)
		cam?.heading = ori
		map.camera = cam!
	}
	
	
	/* UITextField Delegate protocol : */
	
	func textField(_ textFild: UITextField,
				   shouldChangeCharactersIn range: NSRange,
				   replacementString string: String) -> Bool {
		print("Map View - textField()")
		
		if textFild.text!.count >= 100 {
			textFild.resignFirstResponder()
		}
		return true
	}
	
	func textFieldDidBeginEditing(_ textField: UITextField) {
		textField.backgroundColor = UIColor(red: 1, green: 0.0, blue: 0.0,
											alpha: 0.2)
		print("Map View - textFieldDidBeginEditing()")
		textField.borderStyle = .bezel
		textField.text = ""
	}
	
	func textFieldDidEndEditing(_ textField: UITextField) {
		textField.backgroundColor = UIColor(red: 0.98, green: 0.94, blue: 0.54,
											alpha: 0.5)
		print("Map View - textFieldDidEndEditing()")
		textField.borderStyle = .roundedRect
	}

	
	/* ***** Draw : ***** */
	
	func drawInSize(_ size: CGSize) {
		print("Map View - drawInSize()")

		let h = size.height
		let w = size.width
		
		let margine : CGFloat = 24.0
		let elemHeight : CGFloat = 30.0
		let hederSize : CGFloat
		let distance : CGFloat = 8.0
		
		if UIDevice.current.userInterfaceIdiom == .phone &&
				UIScreen.main.bounds.size.height < 667 {
			hederSize = margine * 2
		} else {
			hederSize = margine * 3.5
		}
		
		var originY : CGFloat = hederSize;

		self.backgroundColor = .yellow
		
		textField.frame = CGRect(x: distance, y: originY + distance,
								 width: w - (2 * distance),
								 height: hederSize * 2)
		originY = textField.frame.origin.y + textField.frame.height
		
		map.frame = CGRect(x: distance, y: originY + distance,
						   width: w - (2 * distance),
						   height: h - (originY + hederSize + (2 * distance)))
		originY = map.frame.origin.y

		mapMode.frame = CGRect(x: 2 * margine, y: originY + margine,
							   width: w - (4 * margine), height: elemHeight)
	}
}
