//
//  Screenshot_Snapshot.swift
//  Screenshot Snapshot
//
//  Created by BumMo Koo on 2017. 4. 1..
//  Copyright © 2017년 BumMo Koo. All rights reserved.
//

import XCTest

class Screenshot_Snapshot: XCTestCase {
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        
        let app = XCUIApplication()
        setupSnapshot(app)
        app.launch()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSnapshot() {
        snapshot("0_Main")
    }
}
