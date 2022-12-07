//
//  WallpaperView.swift
//  Wallaby
//
//  Created by Lukas Nguyen on 2022-11-25.
//

import UIKit
import SwiftUI

struct WallpaperView: View {
	
	@EnvironmentObject var viewModel: WallpaperViewModel
	
	var wallpaper: Wallpaper = Wallpaper()
	
	@State private var showAlert = false
	@State private var showFavoritedAlert = false
	@State var liked: Bool = false
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
				
				Text("\(wallpaper.author?.authorName ?? "undef")")
					.font(.headline)
				
				
				Text("By: \(wallpaper.author?.authorUsername ?? "undef")")
					.font(.subheadline)
				
				
				Text("Bio: \(wallpaper.author?.bio ?? "undef")")
					.font(.caption)
					.italic()
				
				
				Text("Location: \(wallpaper.author?.location ?? "undef")")
					.font(.caption2)
			}
		}
		.toolbar {
			ToolbarItemGroup {
				Toggle("Favorite", isOn: $liked)
					.onChange(of: self.liked, perform: { newValue in
						print("Value changed: \(newValue)")
						viewModel.favoriteWallpaper(wallpaper: wallpaper)
						liked = true
					})
					.labelsHidden()
					.toggleStyle(FavoriteToggleStyle())
					.alert(isPresented: $showFavoritedAlert) {
						Alert(
							title: Text("Favorited wallpaper."),
							dismissButton: .default(Text("OK"))
						)
					}
				
				Button {
					viewModel.downloadWallpaper(urlString: wallpaper.urls!.full)
					showAlert = true
					
				} label: {
					ZStack {
						Color(.green)
							.frame(width: 40, height: 40)
							.clipShape(Circle())
						
						Image(systemName: "square.and.arrow.down")
							.font(.subheadline)
							.foregroundColor(.white)
					}
				}
				.alert(isPresented: $showAlert) {
					Alert(
						title: Text("Success!"),
						dismissButton: .default(Text("OK"))
					)
				}
			}
		}
	}
}


struct WallpaperView_Previews: PreviewProvider {
	static var previews: some View {
		WallpaperView()
	}
}
