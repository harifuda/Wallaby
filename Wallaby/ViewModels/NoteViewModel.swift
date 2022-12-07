//
//  NoteViewModel.swift
//  Wallaby
//
//  Created by Lukas Nguyen on 2022-12-03.
//

import Combine

class NoteViewModel: ObservableObject {
	@Published var noteRepository = NoteRepository.shared
	@Published var notes = [Note]()
	@Published var updatedNote = Note()
	private var cancellables: Set<AnyCancellable> = []

	init() {
		self.noteRepository.$notesList
			.assign(to: \.notes, on: self)
			.store(in: &cancellables)
		
	}
	
	func writeNote(note: Note) {
		self.noteRepository.add(note)
	}
	
	func deleteNote(note: Note) {
		self.noteRepository.delete(note)
	}
	
	func editNote() {
		print(updatedNote)
		self.noteRepository.update(updatedNote)
	}
}
