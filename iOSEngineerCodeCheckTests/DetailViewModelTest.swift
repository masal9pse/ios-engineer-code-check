//
//  iOSEngineerCodeCheckTests.swift
//  iOSEngineerCodeCheckTests
//
//  Created by 史 翔新 on 2020/04/20.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import XCTest
@testable import iOSEngineerCodeCheck

class DetailViewModelTest: XCTestCase {
    func testGetLanguage_引数にワードが入ったとき() throws {
        let model = DetailViewModel()
        let language = model.getLanguage(language: "Java")
        XCTAssertEqual(language, "Written in Java")
    }
    
    func testGetLanguage_引数が空文字の場合() throws {
        let model = DetailViewModel()
        let language = model.getLanguage(language: "")
        XCTAssertEqual(language, "")
    }
    
    func testGetLanguage_引数がnilの場合() throws {
        let model = DetailViewModel()
        let language = model.getLanguage(language: nil)
        XCTAssertEqual(language, "")
    }
}
