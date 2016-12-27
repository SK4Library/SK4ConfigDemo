//
//  ActionConfig.swift
//  SK4ConfigDemo
//
//  Created by See.Ku on 2016/12/28.
//  Copyright (c) 2016 AxeRoad. All rights reserved.
//

import UIKit
import SK4Config
import SK4Library

class ActionConfig: SK4ConfigUserDefaults {

	// /////////////////////////////////////////////////////////////
	// MARK: - UInt64

	let uint64_1 = SK4ConfigUInt64(title: "Label", identifier: "UInt64 1", value: 0x1234_5678)
	let uint64_2 = SK4ConfigUInt64(title: "TextField", identifier: "UInt64 2", value: 0x90ab_cdef)

	func configUInt64() {
		let sec = addSection(header: "UInt64", identifier: "UInt64")

		// UInt64は基本的に内部で使用

		// 値を表示するだけ
		sec.addConfig(uint64_1)

		// TextFieldで入力
		sec.addConfig(uint64_2)
		uint64_2.cell = SK4ConfigCellTextField(maxLength: 24)
	}

	// /////////////////////////////////////////////////////////////
	// MARK: - Dir

	let dir1 = SK4ConfigAdmin(title: "Color Select")
	let color1 = SK4ConfigUIColor(title: "Color", identifier: "Color 1", value: .red)
	let color2 = SK4ConfigUIColor(title: "Color(ReadOnly)", identifier: "Color 2", value: .blue)

	func configDir() {
		let sec = addSection(header: "Dir", identifier: "Color")
		sec.addConfig(dir1)

		let sub = dir1.addSection(header: "")
		sub.addConfig(color1)
		sub.addConfig(color2)
	}

	// /////////////////////////////////////////////////////////////
	// MARK: - Action

	let action1 = SK4ConfigAction(title: "Reset Action Config")
	let action2 = SK4ConfigAction(title: "Select Color")

	func configAction() {
		let sec = addSection(header: "Action")

		sec.addConfig(action1)
		action1.onAction = { [weak self] vc in
			self?.resetAction(vc: vc)
		}

		sec.addConfig(action2)
		let ac = SK4AlertController(title: "Color", message: "Please select your favorite color.")
		ac.addDefault(title: "Red") { [weak self] ac in
			self?.selectColor(.red)
		}

		ac.addDefault(title: "Green") { [weak self] ac in
			self?.selectColor(.green)
		}

		ac.addDefault(title: "Blue") { [weak self] ac in
			self?.selectColor(.blue)
		}

		action2.alertController = ac.make()
	}

	func selectColor(_ color: UIColor) {
		action2.textColor = color
		action2.reloadTable()
	}

	func resetAction(vc: UIViewController) {
		reset()
		action1.reloadTable()
		SK4AlertController.present(title: "Reset", message: "Reset completed normally.", parent: vc)
	}

	// /////////////////////////////////////////////////////////////
	// MARK: - Special

	let bool1 = SK4ConfigBool(title: "Detail", identifier: "Special 1", value: true)
	let string1 = SK4ConfigString(title: "Label", identifier: "String 1", value: "bottom")
	let bool2 = SK4ConfigBool(title: "Section", identifier: "Special 2", value: true)

	let int1 = SK4ConfigInt(title: "Label", identifier: "Int 1", value: 100)
	let index1 = SK4ConfigIndex(title: "Index(Segmented)", identifier: "Index 1", value: 0)

	var specialSection: SK4ConfigSection!
	var extraSection: SK4ConfigSection!

	func configSpecial() {
		let sec = addSection(header: "Special")
		specialSection = sec

		sec.addConfig(bool1)
		sec.addConfig(string1)
		sec.addConfig(bool2)

		index1.cell = SK4ConfigCellSegmented()
		index1.textArray = [
			"Yes",
			"No",
			"None"
		]

		changeDetail()
	}

	func changeDetail() {
		let items = [int1, index1]
		if bool1.value {
			specialSection.configArray.insert(items, after: bool1)
		} else {
			specialSection.configArray.remove(items)
		}
	}

	// /////////////////////////////////////////////////////////////
	// MARK: - Extra

	let date1 = SK4ConfigDate(title: "Date", identifier: "Date 1", value: Date(), pickerMode: .date)
	let date2 = SK4ConfigDate(title: "Time", identifier: "Date 2", value: Date(), pickerMode: .time)
	let date3 = SK4ConfigDate(title: "Date&Time", identifier: "Date 3", value: Date(), pickerMode: .dateAndTime)

	func configExtra() {
		let sec = addSection(header: "Extra")
		extraSection = sec

		sec.addConfig(date1)
		sec.addConfig(date2)
		sec.addConfig(date3)
	}

	func changeExtra() {
		if bool2.value {
			userSection.append(extraSection)
		} else {
			userSection.remove(extraSection)
		}
	}

	// /////////////////////////////////////////////////////////////
	// MARK: -

	init() {
		super.init(title: "Action", identifier: "Action")
	}

	override func onSetup() {
		configUInt64()
		configDir()

		configAction()
		configSpecial()
		configExtra()
	}

	override func onChange(_ config: SK4ConfigValue) {
		super.onChange(config)

		if config == bool1 {
			changeDetail()
		}

		if config == bool2 {
			changeExtra()
		}
	}
	
}

// eof
