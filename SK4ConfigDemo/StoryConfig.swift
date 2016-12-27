//
//  StoryConfig.swift
//  SK4ConfigDemo
//
//  Created by See.Ku on 2016/12/29.
//  Copyright (c) 2016 AxeRoad. All rights reserved.
//

import UIKit
import SK4Config

class StoryConfig: SK4ConfigAdmin {

	let action1 = SK4ConfigAction(title: "to Banana")
	let action2 = SK4ConfigAction(title: "to Flora")

	// /////////////////////////////////////////////////////////////
	// MARK: -

	init() {
		super.init(title: "Story Config")
	}

	override func onSetup() {
		let sec = addSection(header: "")

		sec.addConfig(action1)
		sec.addConfig(action2)

		action1.segueId = "Banana"
		action2.segueId = "Flora"
	}

}

// eof
