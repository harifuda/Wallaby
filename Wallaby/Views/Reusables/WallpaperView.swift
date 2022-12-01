//
//  WallpaperView.swift
//  Wallaby
//
//  Created by Lukas Nguyen on 2022-11-25.
//

import UIKit
import SwiftUI

struct WallpaperView: View {
	var wallpaper: Wallpaper = Wallpaper()
	@State private var showAlert = false
	var body: some View {
		VStack {
			if let imageURL = URL(string: wallpaper.urls?.full ?? "none") {
				AsyncImage(url: imageURL) { image in
					image
						.resizable()
						.aspectRatio(contentMode: .fit)
				} placeholder: {
					Image(systemName: "photo")
				}
				
			}
			VStack{
				
				Text("Author name: \(wallpaper.author?.authorName ?? "undef")")
					.font(.headline)
				
				
				Text("Author username: \(wallpaper.author?.authorUsername ?? "undef")")
					.font(.subheadline)
				
				
				Text("Bio: \(wallpaper.author?.bio ?? "undef")")
					.font(.caption)
					.italic()
				
				
				Text("Location: \(wallpaper.author?.location ?? "undef")")
					.font(.caption2)
			}
		}
		.navigationBarItems(leading: Button(action: {}
			,label: {
			ZStack {
				Color(.red)
					.frame(width: 40, height: 40)
					.clipShape(Circle())
				
				Image(systemName: "heart")
					.font(.title)
					.foregroundColor(.white)
			}
		}) ,trailing: Button {
			let urlString = URL(string: wallpaper.urls!.full)
			let session = URLSession.shared
			
			if let data = try? Data(contentsOf: urlString!) {
				
				let image: UIImage = UIImage(data: data)!
				let imageSaver = ImageSaver()
				imageSaver.writeToPhotoAlbum(image: image)
				showAlert = true
			}
			//			let data = session.dataTask(with: urlString!){ data, response, error in
			//
			//				let image: UIImage = UIImage(data: data!)!
			//				let imageSaver = ImageSaver()
			//				imageSaver.writeToPhotoAlbum(image: image)
			//				showAlert = true
			//			}
		} label: {
			ZStack {
				Color(.green)
					.frame(width: 40, height: 40)
					.clipShape(Circle())
				
				Image(systemName: "square.and.arrow.down")
					.font(.title)
					.foregroundColor(.white)
			}
			
		}
			.alert(isPresented: $showAlert) {
				Alert(
					title: Text("Success!"),
					dismissButton: .default(Text("OK"))
				)
			}
		)
	}
	
}

struct WallpaperView_Previews: PreviewProvider {
	static var previews: some View {
		WallpaperView()
	}
}
