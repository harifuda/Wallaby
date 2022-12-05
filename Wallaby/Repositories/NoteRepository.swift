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
	
	@Published var notesList: [Note] = []
	
	private let path = "notes"
	private let store = Firestore.firestore()
	
	init() {
		get()
	}
	
	func get() {
		store.collection(path).addSnapshotListener { snapshot, error in
			if let error = error {
				print(error.localizedDescription)
				return
			}
			
			self.notesList = snapshot?.documents.compactMap {
				try? $0.data(as: Note.self)
			} ?? []
		}
	}
	
	func add(_ note: Note) {
		do {
			_ = try store.collection(path).addDocument(from: note)
		} catch {
			print(error.localizedDescription)
		}
	}
	
	func delete(_ note: Note) {
		if let documentId = note.id {
			store.collection(path).document(documentId).delete { error in
				if let error = error {
					print(error.localizedDescription)
				}
			}
		}
	}
	
	func update(_ note: Note) {
		if let documentId = note.id {
			do {
				try store.collection(path).document(documentId).setData(from: ["text": note.text], merge: true)
			} catch {
				fatalError("Unable to update document with id: \(documentId)")
			}
		}
	}
}
