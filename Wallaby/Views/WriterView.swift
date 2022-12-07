//
//  WriterView.swift
//  Wallaby
//
//  Created by Lukas Nguyen on 2022-12-04.
//

import SwiftUI

struct WriterView: View {
	
	@Environment(\.presentationMode) var presentationMode
	
	@Binding var mode: Bool
	@EnvironmentObject var viewModel: NoteViewModel
	
	@State var title: String = ""
	@State var text: String = ""
	
	var body: some View {
		NavigationView {
			Form {
				Section(header: Text("Title")) {
					TextField("Title", text: mode ? $title : $viewModel.updatedNote.title)
				}
				
				Section(header: Text("Notes")) {
					TextField("Notes", text: mode ? $text : $viewModel.updatedNote.text)
				}
			}
			.navigationBarItems(leading: Button {
				presentationMode.wrappedValue.dismiss()
			} label: {
				Text("Cancel")
			},trailing: Button {
				if mode == true {
					let newNote = Note(title: title, text: text)
					viewModel.writeNote(note: newNote)
					self.mode = false
				}
				else {
					viewModel.editNote()
					presentationMode.wrappedValue.dismiss()
				}
			} label: {
				Text("Save")
			})
		}
		
	}
}


