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

        AsyncImage(url: URL(string: item.owner.avatarUrl)) { phase in
            switch phase {
            case let .success(image):
                image.resizable().scaledToFit()
            case .failure:
                Image("no_image")
            case .empty:
                ProgressView()
            @unknown default:
                EmptyView()
            }
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
            searchApiState.apiResponse = SearchApiState.preview
            return searchApiState
        }())
    }
}
