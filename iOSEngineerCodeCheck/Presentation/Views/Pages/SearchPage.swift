//
//  GoodByeUIKitApp.swift
//  iOSEngineerCodeCheck
//
//  Created by 山本大翔 on 2023/07/31.
//  Copyright © 2023 YUMEMI Inc. All rights reserved.
//
import SwiftUI

struct SearchPage: View {
    @State private var name = ""
    @State private var editting = false
    @EnvironmentObject var searchApiState: SearchApiState

    var body: some View {
        NavigationView {
            VStack {
                SearchFormField(action: {
                    Task {
                        try await searchApiState.getGitHubApiResponse(searchedWord: name)
                    }
                }, name: $name, editting: $editting)
                if searchApiState.apiResponse != nil {
                    List {
                        ForEach(searchApiState.apiResponse!.items.indices, id: \.self) { index in
                            NavigationLink(destination: DetailPage(index: index)) {
                                Text(searchApiState.apiResponse!.items[index].fullName)
                            }
                        }
                    }
                }
                Spacer()
            }.navigationTitle("Github検索アプリ")
        }
    }
}

struct SearchPage_Previews: PreviewProvider {
    static var previews: some View {
        SearchPage().environmentObject({ () -> SearchApiState in
            let searchApiState = SearchApiState(searchApiRepository: GitHubApiRepository())
            searchApiState.apiResponse = ApiResponse(totalCount: 1, items: [Item(name: "Flutter Sample App", fullName: "Sample App", stargazersCount: 1, watchersCount: 2, forksCount: 3, openIssuesCount: 3, language: "ja", owner: Owner(avatarUrl: "https://avatars.githubusercontent.com/u/84199788?v=4"))])
            return searchApiState
        }())
    }
}
