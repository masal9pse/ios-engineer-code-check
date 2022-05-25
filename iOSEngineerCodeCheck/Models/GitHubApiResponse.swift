//
//  GitHubApiResponse.swift
//  iOSEngineerCodeCheck
//
//  Created by 山本大翔 on 2022/05/23.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import Foundation

class GitHubApiResponse: Codable {
    let totalCount: Int
    let item: [Item]
//    enum Coding
}

class Item: Codable {
    let name: String
    let stargazersCount: Int
}

class GitHunApiFailResponse
