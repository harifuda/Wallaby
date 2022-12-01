//
//  WebService.swift
//  Wallaby
//
//  Created by Lukas Nguyen on 2022-11-18.
//

import SwiftUI

class WebService: ObservableObject {
	
	static var shared = WebService()
	var jsonWallpapers: [Wallpaper] = []
	let token = "Hq6boUk65Y-dEZhTgzTR3WESV-sdKp0j1YTs8zo9_QE"
	@Published var publishedWallpapers: [Wallpaper] = []
	init() {
		getWallpapers()
	}
	
	func getWallpapers() {
		if let url = URL(string: "https://api.unsplash.com/photos/random/?count=50&client_id=\(token)") {
			let apiRequest = URLRequest(url: url)
			URLSession.shared.dataTask(with: apiRequest) { data, response, error in
				if let response = data {
					print("Acquired data")
					do {
						let wallpapers = try JSONDecoder().decode([Wallpaper].self, from: response)
						
						for wallpaper in wallpapers {
							//print(wallpaper)
							self.jsonWallpapers.append(wallpaper)
						}
						print(self.jsonWallpapers.count)
						DispatchQueue.main.async {
							self.publishedWallpapers = self.jsonWallpapers
						}
					} catch {
						print(error)
					}
				}
			}
			.resume()
		}
			
	}
}
