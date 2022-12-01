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
	var body: some Scene {
		
		init() {
			FirebaseApp.configure()
		}
		
		WindowGroup {
			ContentView()
		}
	}
}
