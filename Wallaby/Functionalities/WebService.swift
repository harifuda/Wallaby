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
	
	func downloadWallpaper(wallpaperURL: String){
		if let urlString = URL(string:wallpaperURL) {
			
			let request = URLRequest(url: urlString)
			URLSession.shared.dataTask(with: request) { data, response, error in
				if let data = try? Data(contentsOf: urlString) {
					
					let image: UIImage = UIImage(data: data)!
					let imageSaver = ImageSaver()
					imageSaver.writeToPhotoAlbum(image: image)
				}
			}
			.resume()
		}
		
	}
	
	func searchWallpapers(query: String) {
		
	}
}

