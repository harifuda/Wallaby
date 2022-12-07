//
//  NotesView.swift
//  Wallaby
//
//  Created by Lukas Nguyen on 2022-12-02.
//

import SwiftUI

struct NotesView: View {
		
	@EnvironmentObject var viewModel: NoteViewModel
	@State var writing: Bool = false
	@State var editing: Bool = false
	
	@State private var selected: Bool = false
	var body: some View {
		NavigationView {
			List {
				ForEach(viewModel.notes, id:\.id) { note in
					VStack{
						Text(note.title)
							.font(.headline)
					}
					.swipeActions {
						Button {
							viewModel.deleteNote(note: note)
						} label: {
							Label("Delete", systemImage: "trash")
						}
						.tint(.red)
						
						Button {
							viewModel.updatedNote = note
							self.editing.toggle()
							print("Edit: \(editing) | Write: \(writing)")

						} label: {
							Label("Update", systemImage: "square.and.pencil")
						}
						.tint(.blue)
						
						Button {
							selected = true
						} label: {
							Label("View", systemImage: "note.text")
						}
						.tint(.green)
					}
					.alert(isPresented: $selected) {
						Alert(title: Text(note.title), message: Text(note.text), dismissButton: .default(Text("OK")))
					}
				}
			}
			.navigationBarItems(trailing:  Button(action: {
				self.writing.toggle()
				print("Edit: \(editing) | Write: \(writing)")

			}) {
				Image(systemName: "note.text.badge.plus")
			})
			.sheet(isPresented: $writing) {
				WriterView(mode: $writing)
			}
			.sheet(isPresented: $editing) {
				WriterView(mode: $writing)
			}
		}
	}
}
