//
//  OneCell.swift
//  MyActivities
//
//  Created by Robin Blottière--Mayo on 02/12/2018.
//  Copyright © 2018 Robin Blottière--Mayo. All rights reserved.
//

import UIKit

class OneCell: NSObject {
	var label = ""
	var detail = ""
	
	init(l: String, d: String) {
		print("OneCell - init()")

		label = l
		detail = d
	}
}
