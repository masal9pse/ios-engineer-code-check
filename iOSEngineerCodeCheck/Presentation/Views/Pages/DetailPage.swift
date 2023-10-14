//
//  DetailPage.swift
//  iOSEngineerCodeCheck
//
//  Created by 山本大翔 on 2023/08/27.
//  Copyright © 2023 YUMEMI Inc. All rights reserved.
//

import SwiftUI

struct DetailPage: View {
    @EnvironmentObject var searchApiState: SearchApiState
    let index: Int
    var body: some View {
        // 詳細ページに遷移した時点で、apiResponseListがnullになることはないので強制アンラップで対処
        let item = searchApiState.apiResponse!.items[index]
        
        // 画像のパスが空文字だった場合の対応が抜けている
        AsyncImage(url: URL(string: item.owner?.avatarUrl ?? "")) { image in
            image.resizable().scaledToFit()
        } placeholder: {
            ProgressView()
        }
        Text(item.fullName).padding(.top, 30).padding(.bottom, 20)
        HStack {
            Spacer()
            Text("Written in \(item.language ?? "")")
            Spacer()
            VStack {
                Text("\(item.stargazersCount) stars")
                Text("\(item.watchersCount) watchers")
                Text("\(item.forksCount) forks")
                Text("\(item.openIssuesCount) open issues")
            }
            Spacer()
        }.padding(.bottom, 30)
    }
}

struct DetailPage_Previews: PreviewProvider {
    static var previews: some View {
        DetailPage(index: 0).environmentObject({ () -> SearchApiState in
            let searchApiState = SearchApiState(searchApiRepository: GitHubApiRepository())
            searchApiState.apiResponse = ApiResponse(totalCount: 1, items: [Item(name: "Flutter Sample App", fullName: "Sample App", stargazersCount: 1, watchersCount: 2, forksCount: 3, openIssuesCount: 3, language: "ja", owner: nil)])
            return searchApiState
        }())
    }
}
