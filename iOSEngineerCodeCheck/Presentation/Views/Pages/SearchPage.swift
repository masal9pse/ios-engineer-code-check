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
    @ObservedObject var searchApiState: SearchApiState

    init(searchApiRepository: SearchApiRepositoryProtocol) {
        searchApiState = SearchApiState(searchApiRepository: searchApiRepository)
    }

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
                            NavigationLink(destination: DetailPage(searchApiState: searchApiState, index: index)) {
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
