//
//  ViewController.swift
//  Wallaby
//
//  Created by Lukas Nguyen on 2022-11-29.
//

import UIKit

class ImageSaver: NSObject {
	func writeToPhotoAlbum(image: UIImage) {
		UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveCompleted), nil)
	}
	
	@objc func saveCompleted(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
		print("Save finished!")
	}
}
