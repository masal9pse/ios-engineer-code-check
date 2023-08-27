//
//  GoodByeUIKitApp.swift
//  iOSEngineerCodeCheck
//
//  Created by 山本大翔 on 2023/07/31.
//  Copyright © 2023 YUMEMI Inc. All rights reserved.
//
import SwiftUI

struct SearchPage: View {
    @ObservedObject var searchApiState: SearchApiState
    
    init(searchApiRepository: SearchApiRepositoryProtocol) {
        self.searchApiState = SearchApiState(searchApiRepository: searchApiRepository)
    }
    
    var body: some View {
        Button("ナシ追加", action: {
            Task {
                try await searchApiState.getGitHubApiResponse(searchedWord: "php")
            }
        })
        if searchApiState.apiResponseList != nil {
            NavigationView {
                List {
                    ForEach(searchApiState.apiResponseList!.items.indices, id: \.self) { index in
                        NavigationLink(destination: DetailPage(info: searchApiState.apiResponseList!.items[index].fullName)) {
                            Text(searchApiState.apiResponseList!.items[index].fullName)
                        }
                    }
                }
            }
        }
    }
}
