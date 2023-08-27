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
        self.searchApiState = SearchApiState(searchApiRepository: searchApiRepository)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("キーワードを入力して下さい", text: $name,
                          /// リターンキーが押された時の処理
                          onCommit: {
                              Task {
                                  try await searchApiState.getGitHubApiResponse(searchedWord: self.name)
                              }
                          })
                          .textFieldStyle(RoundedBorderTextFieldStyle()) // 入力域を枠で囲む
                          .padding() // 余白を追加
                          // 編集フラグがONの時に枠に影を付ける
                          .shadow(color: editting ? .blue : .clear, radius: 3)
                if searchApiState.apiResponseList != nil {
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
}
