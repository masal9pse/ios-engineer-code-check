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
        VStack {
            Button("ボタン", action: {
                Task {
                    try await searchApiState.getGitHubApiResponse(searchedWord: "php")
                }
            })
            TextField("名前を入力して下さい", text: $name,
                      
                      onEditingChanged: { begin in
                          /// 入力開始処理
                          if begin {
                              self.editting = true // 編集フラグをオン
                              /// 入力終了処理
                          } else {
                              self.editting = false // 編集フラグをオフ
                          }
                      },
                      
                      /// リターンキーが押された時の処理
                      onCommit: {
                          self.message = "こんにちは、\(self.name)さん" // メッセージセット
                          self.name = "" // 入力域をクリア
                               
                      })
                      .textFieldStyle(RoundedBorderTextFieldStyle()) // 入力域を枠で囲む
                      .padding() // 余白を追加
                      // 編集フラグがONの時に枠に影を付ける
                      .shadow(color: editting ? .blue : .clear, radius: 3)
                       
        }
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
