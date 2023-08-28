//
//  GitHubApiRepository.swift
//  iOSEngineerCodeCheck
//
//  Created by 山本大翔 on 2023/08/21.
//  Copyright © 2023 YUMEMI Inc. All rights reserved.
//

import Foundation

/// WebAPIのエラー
enum WebApiError: Error {
    case dataNotFound
}

class GitHubApiRepository: SearchApiRepositoryProtocol {
    func getGitHubApiResponse(searchedWord: String) async throws -> GitHubApiResponse? {
        let api = URL(string: "https://api.github.com/search/repositories?q=\(searchedWord)")!
//        guard let api else {
//            throw WebApiError.dataNotFound
//        }
        let (data, _) = try await URLSession.shared.data(from: api, delegate: nil)
        let response = try? JSONDecoder().decode(GitHubApiResponse.self, from: data)
        return response
    }
}
