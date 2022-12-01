//
//  NoteRepository.swift
//  Wallaby
//
//  Created by Lukas Nguyen on 2022-11-25.
//

import FirebaseFirestore
import FirebaseFirestoreSwift

class NoteRepository: ObservableObject {
	
	static var shared = NoteRepository()
	
	@Published var list: [Note] = []
	
	private let path = "notes"
	private let store = Firestore.firestore()
	
	
}
