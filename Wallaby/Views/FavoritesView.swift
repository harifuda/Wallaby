//
//  FavoritesView.swift
//  Wallaby
//
//  Created by Lukas Nguyen on 2022-12-02.
//

import SwiftUI

struct FavoritesView: View {
	@StateObject var viewModel: WallpaperViewModel = WallpaperViewModel()

	@State var selectedWallpaper: Wallpaper?
    var body: some View {
		TabView {
			NavigationView {
				ScrollView {
					ForEach(viewModel.getFavorites(), id: \.wallpaperId) { image in
							ThumbnailView(wallpaper: image)
							.onTapGesture {
								self.selectedWallpaper = image
							}
					}
				}
			}
			.tabItem() {
				Label("Favorites", systemImage: "heart.circle.fill")
			}
			.sheet(item: $selectedWallpaper) { selected in
				WallpaperView(wallpaper: selected)
			}

			

			NotesView()
			.tabItem() {
				Label("Notes", systemImage: "note.text")
			}
		}
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
