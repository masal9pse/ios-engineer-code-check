//
//  GithubApiRepository.swift
//  iOSEngineerCodeCheck
//
//  Created by 山本大翔 on 2023/08/21.
//  Copyright © 2023 YUMEMI Inc. All rights reserved.
//

import Foundation

class GithubApiRepository: SearchApiRepositoryProtocol {
    func getApiResponse(searchedWord: String) async throws -> ApiResponse? {
        let urlString = "https://api.github.com/search/repositories?q=\(searchedWord)"
        let encodeUrlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let encodeUrl = URL(string: encodeUrlString!)!
        let (data, _) = try await URLSession.shared.data(from: encodeUrl, delegate:
            nil)
        let response = try? JSONDecoder().decode(ApiResponse.self, from: data)
        return response
    }
}
