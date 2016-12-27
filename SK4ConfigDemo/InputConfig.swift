//
//  InputConfig.swift
//  SK4ConfigDemo
//
//  Created by See.Ku on 2016/12/28.
//  Copyright (c) 2016 AxeRoad. All rights reserved.
//

import UIKit
import SK4Config

class InputConfig: SK4ConfigUserDefaults {

	// /////////////////////////////////////////////////////////////
	// MARK: - Int

	let int1 = SK4ConfigInt(title: "Label", identifier: "Int 1", value: 100)
	let int2 = SK4ConfigInt(title: "TextField", identifier: "Int 2", value: 200)

	func configInt() {
		let sec = addSection(header: "Int", identifier: "Int")

		// 値を表示するだけ
		sec.addConfig(int1)

		// TextFieldで入力
		sec.addConfig(int2)
		int2.cell = SK4ConfigCellTextField(maxLength: 12)
	}

	// /////////////////////////////////////////////////////////////
	// MARK: - CGFloat

	let cgfloat1 = SK4ConfigCGFloat(title: "Label", identifier: "CGFloat 1", value: 123.45)
	let cgfloat2 = SK4ConfigCGFloat(title: "TextField(Default)", identifier: "CGFloat 2", value: 23.45)
	let cgfloat3 = SK4ConfigCGFloat(title: "TextField(0.4f)", identifier: "CGFloat 3", value: 56.7891)

	func configCGFloat() {
		let sec = addSection(header: "CGFloat", identifier: "CGFloat")

		// 値を表示するだけ
		sec.addConfig(cgfloat1)

		// TextFieldで入力
		sec.addConfig(cgfloat2)
		cgfloat2.cell = SK4ConfigCellTextField(maxLength: 12)

		// TextFieldで入力（小数点以下4桁まで使用）
		sec.addConfig(cgfloat3)
		cgfloat3.cell = SK4ConfigCellTextField(maxLength: 12)
		cgfloat3.convertFormat = "%0.4f"
	}

	// /////////////////////////////////////////////////////////////
	// MARK: - String

	let string1 = SK4ConfigString(title: "Label", identifier: "String 1", value: "label")
	let string2 = SK4ConfigString(title: "TextField(max 16)", identifier: "String 2", value: "textfield", maxLength: 16)
	let string3 = SK4ConfigString(title: "TextField(ReadOnly)", identifier: "String 3", value: "textfield", maxLength: 16)
	let string4 = SK4ConfigString(title: "TextView(max 140)", identifier: "String 4", value: "", maxLength: 140)

	func configString() {
		let sec = addSection(header: "String", identifier: "String")

		// 文字列を表示
		sec.addConfig(string1)

		// TextFieldで入力
		sec.addConfig(string2)

		// TextFieldで表示
		sec.addConfig(string3)
		string3.readOnly = true

		// TextViewで入力　※最大長で自動で切り替わる
		sec.addConfig(string4)
	}

	// /////////////////////////////////////////////////////////////
	// MARK: -

	init() {
		super.init(title: "Input", identifier: "Input")
	}
	
	override func onSetup() {
		configInt()
		configCGFloat()
		configString()
	}

}

// eof
