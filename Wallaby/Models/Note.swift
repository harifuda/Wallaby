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
	var text: String = ""
}
