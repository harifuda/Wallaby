//
//  Url.swift
//  Wallaby
//
//  Created by Lukas Nguyen on 2022-11-22.
//

import SwiftUI
import FirebaseFirestoreSwift

struct Url: Codable {
	var raw: String = ""
	var full: String = ""
	var regular: String = ""
	var small: String = ""
	var thumb: String = ""
	var smalls3: String = ""
	enum CodingKeys: String, CodingKey {
		case raw = "raw"
		case full = "full"
		case regular = "regular"
		case small = "small"
		case thumb = "thumb"
		case smalls3 = "small_s3"
	}
}
