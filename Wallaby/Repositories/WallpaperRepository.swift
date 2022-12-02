//
//  WallpaperRepository.swift
//  Wallaby
//
//  Created by Lukas Nguyen on 2022-11-25.
//

import FirebaseFirestore
import FirebaseFirestoreSwift

class WallpaperRepository: ObservableObject {
	
	static var shared = WallpaperRepository()
	
	@Published var likedWallpaper : [Wallpaper] = []
	
	private let path = "favorites"
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
			
			self.likedWallpaper = snapshot?.documents.compactMap {
				try? $0.data(as: Wallpaper.self)
			} ?? []
		}
	}
	
	func add(_ wallpaper: Wallpaper) {
		do {
			_ = try store.collection(path).addDocument(from: wallpaper)
		} catch {
			print(error.localizedDescription)
		}
	}
	
	func delete(_ wallpaper: Wallpaper) {
		
		if let documentId = wallpaper.id {
			store.collection(path).document(documentId).delete { error in
				if let error = error {
					print(error.localizedDescription)
				}
			}
		}
	}
}
