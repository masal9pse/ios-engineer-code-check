//
//  UISearchBarModel.swift
//  iOSEngineerCodeCheck
//
//  Created by 山本大翔 on 2023/02/07.
//  Copyright © 2023 YUMEMI Inc. All rights reserved.
//

import Foundation

class UISearchBarModel {
    init(repository: SearchApiRepository) {
        self.repository = repository
    }

    let repository: SearchApiRepository
    func getGitHubApi(searchedWord: String) async throws -> [Item] {
        if !searchedWord.isEmpty {
            let gitHubApiResponse = GitHubApiRepository()
            let response = try await gitHubApiResponse.getGitHubApiResponse(searchedWord: searchedWord)
            return response
        }
        return []
    }
}
