//
//  SearchView.swift
//  Wallaby
//
//  Created by Lukas Nguyen on 2022-12-07.
//

import SwiftUI

struct SearchView: View {
	@State var query = ""
    var body: some View {
		NavigationView {
			List {
				ForEach() {
					
				}
			}
		}
		.searchable(text: $query, prompt: "Looking for something in particular?")
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
