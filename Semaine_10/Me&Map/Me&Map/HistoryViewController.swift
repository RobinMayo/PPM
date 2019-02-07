//
//  HistoryView.swift
//  Me&Map
//
//  Created by Robin Blottière--Mayo on 26/12/2018.
//  Copyright © 2018 Robin Blottière--Mayo. All rights reserved.
//

import UIKit

class HistoryViewController: UITableViewController {
	private var count = 1
	private var content = [[OneCell]]()
	
	override init(style: UITableView.Style) {
		super.init(style: style)
		
		// TableView :
		self.tableView.sectionHeaderHeight = 80.0
		self.tableView.separatorStyle = .singleLine
		self.tableView.backgroundColor = UIColor.white
		
		self.tableView.dataSource = self
		self.tableView.delegate = self
		
		self.clearsSelectionOnViewWillAppear = false
		self.navigationItem.leftBarButtonItem = self.editButtonItem
		self.navigationItem.rightBarButtonItem =
			UIBarButtonItem(barButtonSystemItem: .save, target: self,
							action: nil)
		
		// UITabBar :
		let tabBarItem = UITabBarItem(tabBarSystemItem: .recents, tag: 1)
		self.tabBarItem = tabBarItem
		self.title = "History"
		
		print("History View Controller - init()")
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func drawInSize(_ size: CGSize) {
		print("History View Controller - drawInSize()")
	}
	
	override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
		self.drawInSize(size)
	}
	
	
	/* ********** TableViewDataSource protocol ********** */
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		return content.count
	}
	
	override func tableView(_ tableView: UITableView,
							numberOfRowsInSection section: Int) -> Int {
		return content[section].count
	}
	
	override func tableView(_ tableView: UITableView,
							titleForHeaderInSection section: Int) -> String? {
		return ""
	}
	
	override func tableView(_ tableView: UITableView,
							titleForFooterInSection section: Int) -> String? {
		return ""
	}
	
	override func tableView(_ tableView: UITableView,
							cellForRowAt indexPath: IndexPath)
			-> UITableViewCell {
		print("History View Controller - tableView(cellForRowAt indexPath)")
		var cellId = ""
		
		if (indexPath as NSIndexPath).row % 2 == 1 {
			cellId = "odd"
		} else {
			cellId = "even"
		}
		
		var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
		
		if cell === nil {
			cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellId)
		}
		let cont = content[indexPath.section][indexPath.row]
		cell!.textLabel?.text = cont.label
		cell!.detailTextLabel?.text = cont.detail
		return cell!
	}
	
	override func tableView(_ tableView: UITableView,
							viewForHeaderInSection section: Int) -> UIView? {
		print("History View Controller - tableView(viewForHeaderInSection section)")
		
		let w : Double = Double(UIScreen.main.bounds.size.width)
		let h = 80.0
		
		let headerView = UIView(frame: CGRect(x: 0.0, y: 0.0,
											  width: w, height: h))
		
		let backgroundImage = UIImageView(image: UIImage(named: "bg-header"))
		backgroundImage.frame = CGRect(x: 0.0, y: 0.0, width: w, height: h)
		
		let l = UILabel(frame: CGRect(x: 20.0, y: 30.0,
									  width: w - 30, height: 25))
		
		l.textColor = .white
		l.font = UIFont.boldSystemFont(ofSize: 20)
		l.text = "Personal"
		
		headerView.addSubview(backgroundImage)
		headerView.addSubview(l)
		
		return headerView
	}
}
