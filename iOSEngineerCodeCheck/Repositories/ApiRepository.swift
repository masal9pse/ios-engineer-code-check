//
//  ApiRepository.swift
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

protocol SearchApiRepository {
    func getGitHubApiResponse(searchedWord: String) async throws -> [Item]
}
