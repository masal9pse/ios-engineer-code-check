//
//  GitHubApiRepository.swift
//  iOSEngineerCodeCheck
//
//  Created by 山本大翔 on 2023/08/21.
//  Copyright © 2023 YUMEMI Inc. All rights reserved.
//

import Foundation

class GitHubApiRepository: SearchApiRepository {
    func getGitHubApiResponse(searchedWord: String) async throws -> [Item] {
        let api = URL(string: "https://api.github.com/search/repositories?q=\(searchedWord)")
        guard let api = api else {
            throw WebApiError.dataNotFound
        }
        let (data, _) = try await URLSession.shared.data(from: api, delegate: nil)
        let response = try? JSONDecoder().decode(GitHubApiResponse.self, from: data)
        return response?.items ?? []
    }
}
