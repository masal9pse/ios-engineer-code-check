//
//  UISearchBarModel.swift
//  iOSEngineerCodeCheck
//
//  Created by 山本大翔 on 2023/02/07.
//  Copyright © 2023 YUMEMI Inc. All rights reserved.
//

import Foundation

final class UISearchBarModel {
    func getGitHubApi(searchedWord: String) async throws -> GitHubApiResponse? {
        if !searchedWord.isEmpty {
            let gitHubApiResponse = GitHubApiRepository()
            let response = try await gitHubApiResponse.getGitHubApiResponse(searchedWord: searchedWord)
            return response
        }
        return nil
    }
}
