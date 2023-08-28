//
//  SearchApiRepository.swift
//  iOSEngineerCodeCheck
//
//  Created by 山本大翔 on 2023/08/27.
//  Copyright © 2023 YUMEMI Inc. All rights reserved.
//

import Foundation

protocol SearchApiRepositoryProtocol {
    func getGitHubApiResponse(searchedWord: String) async throws -> GitHubApiResponse?
}
