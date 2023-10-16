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

    @Published var apiResponse: ApiResponse?

    func getGitHubApiResponse(searchedWord: String) async throws {
        let response = try await searchApiRepository.getApiResponse(searchedWord: searchedWord)
        DispatchQueue.main.async {
            self.apiResponse = response
        }
    }

    static var preview = ApiResponse(totalCount: 3, items:
        [
            Item(
                name: "App1",
                fullName: "Sample App1",
                stargazersCount: 1,
                watchersCount: 2,
                forksCount: 3,
                openIssuesCount: 3,
                language: "ja",
                owner: Owner(avatarUrl: "https://avatars.githubusercontent.com/u/84199788?v=4")
            ),
            Item(
                name: "App2",
                fullName: "Sample App2",
                stargazersCount: 1,
                watchersCount: 2,
                forksCount: 3,
                openIssuesCount: 3,
                language: "ja",
                owner: Owner(avatarUrl: "https://example.com/avatar2.png")
            ),
            Item(
                name: "App3",
                fullName: "Sample App3",
                stargazersCount: 1,
                watchersCount: 2,
                forksCount: 3,
                openIssuesCount: 3,
                language: "ja",
                owner: Owner(avatarUrl: "https://example.com/avatar3.png")
            )
        ])
}
