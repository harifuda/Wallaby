//
//  WallabyUITests.swift
//  WallabyUITests
//
//  Created by Lukas Nguyen on 2022-12-08.
//

import XCTest
import SwiftUI

final class WallabyUITests: XCTestCase {
	let app = XCUIApplication()
	
	override func setUpWithError() throws {
		// Put setup code here. This method is called before the invocation of each test method in the class.
		
		// In UI tests it is usually best to stop immediately when a failure occurs.
		continueAfterFailure = true
		app.launch()
		// In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
	}
	
	override func tearDownWithError() throws {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
	}
	
	func test_ImageNotNil() throws {
		let image = app.scrollViews["mainScrollView"].children(matching: .other).element(boundBy: 0)
		sleep(6)
		image.tap()
		//link.links.element(boundBy: 4).tap()
		XCTAssertNotNil(image)
	}
	
	func test_SaveImageShouldSucceed() throws {
		let image = app.scrollViews["mainScrollView"].children(matching: .other).element(boundBy: 0)
		sleep(6)
		image.tap()
		
		sleep(6)
		let downloadButton = app.navigationBars["_TtGC7SwiftUI19UIHosting"].buttons["Download"]
		sleep(6)
		downloadButton.tap()
		let target = app.alerts["Success!"]
		
		XCTAssertNotNil(target)
	}
}
