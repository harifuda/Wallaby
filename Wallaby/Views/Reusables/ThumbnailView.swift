//
//  Thumbnail.swift
//  Wallaby
//
//  Created by Lukas Nguyen on 2022-11-25.
//

import SwiftUI

struct ThumbnailView: View {
	let wallpaper: Wallpaper
    var body: some View {
		if let urlString = wallpaper.urls?.small {
			AsyncImage(url: URL(string: urlString)) { image in
				if let image = image {
					image
						.resizable()
						.scaledToFit()
				}
			} placeholder: {
				Image(systemName: "photo")
			}
		}
    }
}

struct ThumbnailView_Previews: PreviewProvider {
    static var previews: some View {
		ThumbnailView(wallpaper: test)
    }
}
