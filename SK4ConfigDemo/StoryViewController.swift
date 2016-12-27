//
//  StoryViewController.swift
//  SK4ConfigDemo
//
//  Created by See.Ku on 2016/12/29.
//  Copyright (c) 2016 AxeRoad. All rights reserved.
//

import UIKit
import SK4Config

class StoryViewController: SK4ConfigTableViewController {

	@IBOutlet weak var configTable: UITableView!

	let admin = StoryConfig()

    override func viewDidLoad() {
        super.viewDidLoad()

		admin.setup()

		setup(tableView: configTable, configAdmin: admin)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

// eof
