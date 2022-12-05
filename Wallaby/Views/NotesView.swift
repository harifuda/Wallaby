//
//  NotesView.swift
//  Wallaby
//
//  Created by Lukas Nguyen on 2022-12-02.
//

import SwiftUI

struct NotesView: View {
	
	@Environment(\.presentationMode) var presentationMode

	@EnvironmentObject var viewModel: NoteViewModel
	@State var writing: Bool = false
	@State var editing: Bool = false

	@State private var selectedNote: Note?
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

						} label: {
							Label("Update", systemImage: "square.and.pencil")
						}
					}
					.onLongPressGesture {
						self.selectedNote = note
					}
					
				}
			}
			.navigationBarItems(trailing:  Button(action: {
				self.writing.toggle()
			}) {
				Image(systemName: "note.text.badge.plus")
			})
			.sheet(item: $selectedNote) { note in
				NavigationView{
					VStack {
						Text(note.title)
							.font(.headline)
							.padding()
						
						Divider()
						
						Text(note.text)
							.font(.caption)
							.padding()
					}
					.navigationBarItems(trailing: Button {
						presentationMode.wrappedValue.dismiss()
					} label: {
						Text("Exit")
					})
				}
				
			}
			.sheet(isPresented: $writing) {
				WriterView(showWriterView: self.$writing)
			}
			
		}
	}
}
