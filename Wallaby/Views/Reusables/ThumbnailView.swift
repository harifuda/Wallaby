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
						.aspectRatio(contentMode: .fit)
						.cornerRadius(14)
				}
			} placeholder: {
				Image(systemName: "photo")
			}
		}
    }
}

