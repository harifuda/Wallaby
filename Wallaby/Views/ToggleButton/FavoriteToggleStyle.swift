//
//  FavoriteToggleStyle.swift
//  Wallaby
//
//  Created by Lukas Nguyen on 2022-12-02.
//

import SwiftUI

struct FavoriteToggleStyle: ToggleStyle {
	func makeBody(configuration: Configuration) -> some View {
		HStack {
			configuration.label
			Spacer()
			Rectangle()
				.foregroundColor(configuration.isOn ? .pink : .gray)
				.frame(width: 51, height: 31, alignment: .center)
				.overlay(
					Circle()
						.foregroundColor(.white)
						.padding(.all , 3)
						.overlay(
							Image(systemName: configuration.isOn ? "heart.fill" : "heart")
														   .resizable()
														   .aspectRatio(contentMode: .fit)
														   .font(Font.title.weight(.black))
														   .frame(width: 8, height: 8, alignment: .center)
														   .foregroundColor(configuration.isOn ? .pink : .gray)
						)
						.offset(x: configuration.isOn ? 11 : -11, y: 0)
						.animation(Animation.linear(duration: 0.6))
				)
				.cornerRadius(21)
				.onTapGesture {
					configuration.isOn.toggle()
					print(configuration.isOn)
				}
		}
	}
}
