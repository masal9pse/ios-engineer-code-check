//
//  ApiResponse.swift
//  iOSEngineerCodeCheck
//
//  Created by 山本大翔 on 2022/05/23.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import Foundation

struct ApiResponse: Codable {
    let totalCount: Int
    let items: [Item]

    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case items
    }
}

struct Item: Codable {
    let name: String
    let fullName: String
    let stargazersCount: Int
    let watchersCount: Int
    let forksCount: Int
    let openIssuesCount: Int
    let language: String?
    let owner: Owner

    enum CodingKeys: String, CodingKey {
        case name
        case fullName = "full_name"
        case stargazersCount = "stargazers_count"
        case watchersCount = "watchers_count"
        case forksCount = "forks_count"
        case openIssuesCount = "open_issues_count"
        case language
        case owner
    }
}

struct Owner: Codable {
    let avatarUrl: String
    enum CodingKeys: String, CodingKey {
        case avatarUrl = "avatar_url"
    }
}
