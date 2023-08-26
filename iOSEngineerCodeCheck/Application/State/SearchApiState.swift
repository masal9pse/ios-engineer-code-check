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
    
    @Published var apiResponseList: [GitHubApiResponse] = []
}

@MainActor
final class StateClass: ObservableObject {
    @Published var fruits = ["りんご", "オレンジ", "バナナ"]
    
    func addList() {
        fruits.append("ナシ")
    }
}
