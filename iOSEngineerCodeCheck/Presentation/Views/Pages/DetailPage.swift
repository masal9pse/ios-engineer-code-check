//
//  DetailPage.swift
//  iOSEngineerCodeCheck
//
//  Created by 山本大翔 on 2023/08/27.
//  Copyright © 2023 YUMEMI Inc. All rights reserved.
//

import SwiftUI

struct DetailPage: View {
    let item: Item
    var body: some View {
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
