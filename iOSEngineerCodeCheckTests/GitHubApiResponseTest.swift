//
//  GitHubApiResponseTest.swift
//  iOSEngineerCodeCheckTests
//
//  Created by 史 翔新 on 2020/04/20.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import Foundation
@testable import iOSEngineerCodeCheck
import XCTest

class GitHubApiResponseTest: XCTestCase {
    func test_定義したGitHubApiResponseがエラーなく変換されること() throws {
        // 静的ファイルのため特にエラー処理記載なし
        let bundlePath = Bundle.main.path(forResource: "jsons/one-item", ofType: "json")!
        let jsonData = try! String(contentsOfFile: bundlePath).data(using: .utf8)!
        let decodeData = try JSONDecoder().decode(GitHubApiResponse.self, from: jsonData)

        XCTAssertEqual(decodeData.totalCount, 1)
        XCTAssertEqual(decodeData.items[0].name, "Tetris")
        XCTAssertEqual(decodeData.items[0].owner?.avatarUrl, "https://secure.gravatar.com/avatar/e7956084e75f239de85d3a31bc172ace?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png")
        XCTAssertEqual(decodeData.items[0].stargazersCount, 1)
    }
}
