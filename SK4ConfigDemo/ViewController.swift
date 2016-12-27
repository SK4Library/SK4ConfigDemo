//
//  ViewController.swift
//  SK4ConfigDemo
//
//  Created by See.Ku on 2016/12/27.
//  Copyright (c) 2016 AxeRoad. All rights reserved.
//

import UIKit
import SK4Library

class ViewController: UIViewController {

	@IBAction func onGlobalConfig(_ sender: Any) {
		g_config.openConfigViewController(parent: self)
	}

	@IBAction func onOpenInputConfig(_ sender: Any) {
		g_input.openConfigViewController(parent: self)
	}

	@IBAction func onOpenSelectConfig(_ sender: Any) {
		g_select.openConfigViewController(parent: self)
	}

	@IBAction func onOpenActionConfig(_ sender: Any) {
		g_action.openConfigViewController(parent: self)
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.

	}

	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()

	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

}


// eof
