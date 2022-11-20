//
//  Author.swift
//  Wallaby
//
//  Created by Lukas Nguyen on 2022-11-16.
//

import SwiftUI

struct Author: Identifiable, Codable {
	
	var id: UUID = UUID()
	var authorID: String = ""
	var authorUsername: String = ""
	var authorName: String = ""
	var bio: String = ""
	var location: String = ""
	var socialLinks: [String: String] = [:]
	enum CodingKeys: String, CodingKey {
		case authorID = "id"
		case authorUsername = "username"
		case authorName = "name"
		case bio = "bio"
		case socialLinks = "social"
	}
}
