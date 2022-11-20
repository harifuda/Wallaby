//
//  Wallpaper.swift
//  Wallaby
//
//  Created by Lukas Nguyen on 2022-11-16.
//

import SwiftUI

struct Wallpaper: Identifiable, Codable {
	var id: UUID = UUID()
	var wallpaperId: String = ""
	var url: [String: String] = [:]
	var author: Author
	var favorited: Bool = true
	var notes: [Note] = []
	
	enum CodingKeys: String, CodingKey {
		case wallpaperId = "id"
		case url = "urls"
		case author = "user"
	}
}
