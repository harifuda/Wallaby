//
//  ContentView.swift
//  Wallaby
//
//  Created by Lukas Nguyen on 2022-11-02.
//

import SwiftUI

struct ContentView: View {
	var body: some View {
		
		let imageURL = URL(string: "https://images.unsplash.com/photo-1649289262759-7892e0239840?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=982&q=80")
		let placeholderURL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/681px-Placeholder_view_vector.svg.png")
		
		AsyncImage(url: imageURL) { image in
			image
				.resizable()
				.aspectRatio(contentMode: .fit)
		} placeholder: {
			ProgressView()
				.progressViewStyle(.automatic)
		}
	}
}


struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
