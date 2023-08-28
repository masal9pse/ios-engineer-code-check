//
//  GitHubApiResponseTest.swift
//  iOSEngineerCodeCheckTests
//
//  Created by 史 翔新 on 2020/04/20.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

@testable import iOSEngineerCodeCheck
import XCTest

class GitHubApiResponseTest: XCTestCase {
    let testData = """
     {
      "total_count": 1,
      "items": [
        {
          "name": "Tetris",
          "full_name": "dtrupenn/Tetris",
          "owner": {
            "avatar_url": "https://secure.gravatar.com/avatar/e7956084e75f239de85d3a31bc172ace?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png",
          },
          "stargazers_count": 1,
          "watchers_count": 1,
          "language": "Assembly",
          "forks_count": 0,
          "open_issues_count": 0,
          "forks": 1,
          "open_issues": 1,
          "watchers": 1,
        }
      ]
    }
    """

    func test_定義したGitHubApiResponseがエラーなく変換されること() throws {
        let jsonData = testData.data(using: .utf8)!
        let decodeData = try JSONDecoder().decode(GitHubApiResponse.self, from: jsonData)
        XCTAssertEqual(decodeData.totalCount, 1)
        XCTAssertEqual(decodeData.items[0].name, "Tetris")
        XCTAssertEqual(decodeData.items[0].owner?.avatarUrl, "https://secure.gravatar.com/avatar/e7956084e75f239de85d3a31bc172ace?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png")
        XCTAssertEqual(decodeData.items[0].stargazersCount, 1)
    }
}
