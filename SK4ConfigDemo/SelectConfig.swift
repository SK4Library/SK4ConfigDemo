//
//  SelectConfig.swift
//  SK4ConfigDemo
//
//  Created by See.Ku on 2016/12/28.
//  Copyright (c) 2016 AxeRoad. All rights reserved.
//

import UIKit
import SK4Config

class SelectConfig: SK4ConfigUserDefaults {

	// /////////////////////////////////////////////////////////////
	// MARK: - Bool

	let bool1 = SK4ConfigBool(title: "Switch", identifier: "Bool 1", value: true)
	let bool2 = SK4ConfigBool(title: "Switch(ReadOnly)", identifier: "Bool 2", value: true)

	func configBool() {
		let sec = addSection(header: "Bool", identifier: "Bool")

		// Switchで選択
		sec.addConfig(bool1)

		// Switchで選択（読み取り専用）
		sec.addConfig(bool2)
		bool2.readOnly = true
	}
	
	// /////////////////////////////////////////////////////////////
	// MARK: - Index

	let index1 = SK4ConfigIndex(title: "Index", identifier: "Index 1", value: 0)
	let index2 = SK4ConfigIndex(title: "Index(ReadOnly)", identifier: "Index 2", value: 0)
	let index3 = SK4ConfigIndex(title: "Index(Segmented)", identifier: "Index 3", value: 0)
	let index4 = SK4ConfigIndex(title: "Color Index", identifier: "Index 4", value: 0)

	func configIndex() {
		let sec = addSection(header: "Index", identifier: "Index")

		sec.addConfig(index1)
		index1.textArray = Calendar.current.weekdaySymbols

		sec.addConfig(index2)
		index2.textArray = [
			"red",
			"blue",
			"green",
			"white",
		]
		index2.readOnly = true

		sec.addConfig(index3)
		index3.cell = SK4ConfigCellSegmented()
		index3.textArray = [
			"Yes",
			"No",
			"None"
		]

		// TODO: Color Index専用のValueを作る？

		sec.addConfig(index4)
		index4.cell = SK4ConfigCellColorIndex()
		let ar: [UIColor] = [
			.black,
			.darkGray,
			.lightGray,
			.white,
			.gray,
			.green,
			]

		index4.textArray = ar.map { $0.toString() }
		index4.detailArray = [
			"black",
			"darkGray",
			"lightGray",
			"white",
			"gray",
			"green",
		]
	}

	// /////////////////////////////////////////////////////////////
	// MARK: - Date

	let date1 = SK4ConfigDate(title: "Date", identifier: "Date 1", value: Date(), pickerMode: .date)
	let date2 = SK4ConfigDate(title: "Time", identifier: "Date 2", value: Date(), pickerMode: .time)
	let date3 = SK4ConfigDate(title: "Date&Time", identifier: "Date 3", value: Date(), pickerMode: .dateAndTime)

	func configDate() {
		let sec = addSection(header: "Date", identifier: "Date")

		sec.addConfig(date1)
		sec.addConfig(date2)
		sec.addConfig(date3)
	}

	// /////////////////////////////////////////////////////////////
	// MARK: - Color

	let color1 = SK4ConfigUIColor(title: "Color", identifier: "Color 1", value: .red)
	let color2 = SK4ConfigUIColor(title: "Color(ReadOnly)", identifier: "Color 2", value: .blue)

	func configColor() {
		let sec = addSection(header: "Color", identifier: "Color")

		sec.addConfig(color1)
		sec.addConfig(color2)
		color2.readOnly = true
	}

	// /////////////////////////////////////////////////////////////
	// MARK: - Multi

	let multi1 = SK4ConfigMulti(title: "Multi", identifier: "Multi 1", separater: " ")
	let multi2 = SK4ConfigMulti(title: "Multi(ReadOnly)", identifier: "Multi 2", separater: " ")

	func configMulti() {
		let sec = addSection(header: "Multi", identifier: "Multi")

		let ar = (5...25).map { "\($0)" }

		sec.addConfig(multi1)
		multi1.annotation = "Width x Height"
		multi1.addUnit(items: ar)
		multi1.addUnit(item: "x", width: 80)
		multi1.addUnit(items: ar)

		sec.addConfig(multi2)
		multi2.annotation = "Width x Height"
		multi2.addUnit(items: ar)
		multi2.addUnit(item: "x", width: 80)
		multi2.addUnit(items: ar)
		multi2.readOnly = true
	}

	// /////////////////////////////////////////////////////////////
	// MARK: -

	init() {
		super.init(title: "Select", identifier: "Select")
	}

	override func onSetup() {
		configBool()
		configIndex()

		configDate()
		configColor()
		configMulti()
	}
	
}

// eof
