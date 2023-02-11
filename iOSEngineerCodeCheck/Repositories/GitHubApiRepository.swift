//
//  GitHubApiRepository.swift
//  iOSEngineerCodeCheck
//
//  Created by 山本大翔 on 2022/05/23.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import Foundation

/// WebAPIのエラー
enum WebApiError: Error {
    case dataNotFound
}

class GitHubApiRepository {
    func getGitHubApiResponse(searchedWord: String) async throws -> [Item] {
        let api = URL(string: "https://api.github.com/search/repositories?q=\(searchedWord)")
        guard let api else {
            throw WebApiError.dataNotFound
        }
        let (data, _) = try await URLSession.shared.data(from: api, delegate: nil)
        let response = try? JSONDecoder().decode(GitHubApiResponse.self, from: data)
        return response?.items ?? []
    }
}
