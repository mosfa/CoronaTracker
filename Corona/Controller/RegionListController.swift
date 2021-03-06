//
//  RegionListController.swift
//  Corona Tracker
//
//  Created by Mohammad on 3/14/20.
//  Copyright © 2020 Samabox. All rights reserved.
//

import UIKit

class RegionListController: UITableViewController {
	var regions: [Region] = [] {
		didSet {
			tableView.reloadData()
		}
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		tableView.rowHeight = 55
	}

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)

	}

	// MARK: - Table view data source

	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return regions.count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let identifier = String(describing: RegionCell.self)
		let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! RegionCell

		let region = regions[indexPath.row]
		cell.region = region

		return cell
	}
}

class RegionCell: UITableViewCell {
	var region: Region? {
		didSet {
			labelName.text = region?.localizedLongName
			labelStats.text = region?.report?.stat.confirmedCountString
		}
	}

	@IBOutlet var labelName: UILabel!
	@IBOutlet var labelStats: UILabel!

	override func awakeFromNib() {
		super.awakeFromNib()

		backgroundColor = .clear
	}
}
