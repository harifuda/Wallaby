//
//  Note.swift
//  Wallaby
//
//  Created by Lukas Nguyen on 2022-11-16.
//

import Foundation
import FirebaseFirestoreSwift

struct Note: Identifiable, Codable {
	@DocumentID var id: String? = ""
	var title: String = ""
	var text: String = ""
	
	init() {
		
	}
	
	init(title: String, text: String) {
		self.title = title
		self.text = text
	}
}
