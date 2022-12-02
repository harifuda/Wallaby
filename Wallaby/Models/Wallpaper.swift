//
//  Wallpaper.swift
//  Wallaby
//
//  Created by Lukas Nguyen on 2022-11-16.
//

import SwiftUI
import FirebaseFirestoreSwift

struct Wallpaper: Identifiable, Codable {

	@DocumentID var id: String?
	var wallpaperId: String = ""
	var urls: Url? = nil
	var author: Author? = nil

	enum CodingKeys: String, CodingKey {
		case wallpaperId = "id"
		case urls = "urls"
		case author = "user"
	}
	
	init() {}
	init(wallpaperId: String, urls: Url?, author: Author?) {
		self.wallpaperId = wallpaperId
		self.urls = urls
		self.author = author
	}
}

let test = Wallpaper(wallpaperId: "MYomVPpR5FU", urls: Url(raw: "https://images.unsplash.com/photo-1664575197229-3bbebc281874?ixid=MnwzNzY3NTl8MXwxfGFsbHwxfHx8fHx8Mnx8MTY2OTM4ODUxMw&ixlib=rb-4.0.3", full: "https://images.unsplash.com/photo-1664575197229-3bbebc281874?crop=entropy&cs=tinysrgb&fm=jpg&ixid=MnwzNzY3NTl8MXwxfGFsbHwxfHx8fHx8Mnx8MTY2OTM4ODUxMw&ixlib=rb-4.0.3&q=80", regular: "", small: "https://images.unsplash.com/photo-1664575197229-3bbebc281874?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzNzY3NTl8MXwxfGFsbHwxfHx8fHx8Mnx8MTY2OTM4ODUxMw&ixlib=rb-4.0.3&q=80&w=400", thumb: "https://images.unsplash.com/photo-1664575197229-3bbebc281874?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzNzY3NTl8MXwxfGFsbHwxfHx8fHx8Mnx8MTY2OTM4ODUxMw&ixlib=rb-4.0.3&q=80&w=200", smalls3: "https://s3.us-west-2.amazonaws.com/images.unsplash.com/small/photo-1664575197229-3bbebc281874"), author: Author(authorID: "kSlnstJTnY8", authorUsername: "windows", authorName: "Windows", bio: "Makes the everyday easier.", location: nil))

let test2 = Wallpaper(wallpaperId: "MYomVPpR5FU", urls: Url(raw: "https://images.unsplash.com/photo-1664575197229-3bbebc281874?ixid=MnwzNzY3NTl8MXwxfGFsbHwxfHx8fHx8Mnx8MTY2OTM4ODUxMw&ixlib=rb-4.0.3", full: "https://images.unsplash.com/photo-1664575197229-3bbebc281874?crop=entropy&cs=tinysrgb&fm=jpg&ixid=MnwzNzY3NTl8MXwxfGFsbHwxfHx8fHx8Mnx8MTY2OTM4ODUxMw&ixlib=rb-4.0.3&q=80", regular: "", small: "https://images.unsplash.com/photo-1664575197229-3bbebc281874?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzNzY3NTl8MXwxfGFsbHwxfHx8fHx8Mnx8MTY2OTM4ODUxMw&ixlib=rb-4.0.3&q=80&w=400", thumb: "https://images.unsplash.com/photo-1664575197229-3bbebc281874?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzNzY3NTl8MXwxfGFsbHwxfHx8fHx8Mnx8MTY2OTM4ODUxMw&ixlib=rb-4.0.3&q=80&w=200", smalls3: "https://s3.us-west-2.amazonaws.com/images.unsplash.com/small/photo-1664575197229-3bbebc281874"), author: Author(authorID: "kSlnstJTnY8", authorUsername: "windows", authorName: "Windows", bio: "Makes the everyday easier.", location: nil))
