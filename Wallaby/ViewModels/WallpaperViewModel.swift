//
//  WallpaperViewModel.swift
//  Wallaby
//
//  Created by Lukas Nguyen on 2022-11-18.
//

import Combine

class WallpaperViewModel: ObservableObject {
	
	@Published var wallpaperRepository = WallpaperRepository.shared
	@Published var webService = WebService.shared
	@Published var wallpapers = [Wallpaper]()
	@Published var likedWallpapers = [Wallpaper]()

	private var cancellables: Set<AnyCancellable> = []

	init() {
		self.webService.$publishedWallpapers
			.assign(to: \.wallpapers, on: self)
			.store(in: &cancellables)
		
		self.wallpaperRepository.$likedWallpaper
			.assign(to: \.likedWallpapers, on:self)
			.store(in: &cancellables)
	}
	
	func favoriteWallpaper(wallpaper: Wallpaper) {
		self.wallpaperRepository.add(wallpaper)
	}
	
	func unfavoriteWallpaper(wallpaper: Wallpaper) {
		self.wallpaperRepository.delete(wallpaper)
	}
	
	func downloadWallpaper(urlString: String) {
		webService.downloadWallpaper(wallpaperURL: urlString)
	}
}
