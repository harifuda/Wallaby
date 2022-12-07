//
//  WallabyApp.swift
//  Wallaby
//
//  Created by Lukas Nguyen on 2022-11-02.
//

import SwiftUI
import Firebase

@main
struct WallabyApp: App {
	
	@StateObject var notesViewModel: NoteViewModel = NoteViewModel()
	@StateObject var wallpaperViewModel: WallpaperViewModel = WallpaperViewModel()
	
	init() {
		FirebaseApp.configure()
	}
	
	var body: some Scene {
		WindowGroup {
			ContentView()
				.environmentObject(notesViewModel)
				.environmentObject(wallpaperViewModel)
		}
	}
}
