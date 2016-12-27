//
//  GlobalConfig.swift
//  SK4ConfigDemo
//
//  Created by See.Ku on 2016/12/27.
//  Copyright (c) 2016 AxeRoad. All rights reserved.
//

import UIKit
import SK4Library
import SK4Config

class GlobalConfig: SK4ConfigUserDefaults {

	// Settings

	let soundEffect = SK4ConfigBool(title: "Sound Effect", identifier: "Sound Effect", value: true)

	// Information

	let version = SK4ConfigString(title: "Version", value: "")
	let dispCount = SK4ConfigInt(title: "Boot Count", value: 0)



	// Hide

	let bootCount = SK4ConfigInt(title: "BootCount", identifier: "BootCount", value: 0)

	// /////////////////////////////////////////////////////////////
	// MARK: -

	init() {
		super.init(title: "Config", identifier: "Config")
	}

	override func onSetup() {

		// /////////////////////////////////////////////////////////////
		// MARK: - 各種設定

		let settings = addSection(header: "Settings", identifier: "Settings")
		settings.addConfig(soundEffect)


		// /////////////////////////////////////////////////////////////
		// MARK: - 基本的な情報

		let info = addSection(header: "Information", identifier: "Information")

		info.addConfig(version)
		version.value = SK4App.version

		info.addConfig(dispCount)




		// /////////////////////////////////////////////////////////////
		// MARK: - 内部の情報

		hideSection.addConfig(bootCount)
	}

	override func onEditStart() {
		super.onEditStart()

		// 読み込んだ値を編集前に反映
		dispCount.value = bootCount.value
	}

}

// eof
