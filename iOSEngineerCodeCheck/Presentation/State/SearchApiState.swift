//
//  SearchApiState.swift
//  iOSEngineerCodeCheck
//
//  Created by 山本大翔 on 2023/08/27.
//  Copyright © 2023 YUMEMI Inc. All rights reserved.
//

import Foundation

final class SearchApiState: ObservableObject {
    let searchApiRepository: SearchApiRepositoryProtocol
    
    init(searchApiRepository: SearchApiRepositoryProtocol) {
        self.searchApiRepository = searchApiRepository
    }
    
    @Published var apiResponseList: GitHubApiResponse?
    
    func getGitHubApiResponse(searchedWord: String) async throws {
        let response = try await searchApiRepository.getGitHubApiResponse(searchedWord: searchedWord)
        apiResponseList = response
    }
}
