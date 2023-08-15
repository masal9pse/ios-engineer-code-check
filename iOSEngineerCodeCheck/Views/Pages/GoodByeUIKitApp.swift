//
//  GoodByeUIKitApp.swift
//  iOSEngineerCodeCheck
//
//  Created by 山本大翔 on 2023/07/31.
//  Copyright © 2023 YUMEMI Inc. All rights reserved.
//

import SwiftUI

struct GoodByeUIKitApp2: View {
    let fruits = ["りんご", "オレンジ", "バナナ"]
    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Button("hit gitHubAPI", action: {
            Task {
                let api = URL(string: "https://api.github.com/search/repositories?q=php")
                guard let api = api else {
                    throw WebApiError.dataNotFound
                }
                let (data, _) = try await URLSession.shared.data(from: api, delegate: nil)
                let response = try? JSONDecoder().decode(GitHubApiResponse.self, from: data)
                print(response?.items.first?.name)
                let o = 4
            }
        })
        List {
            Text("大根")
            Text("キャベツ")
            Text("じゃがいも")
            ForEach(0 ..< fruits.count) { index in
                Text(fruits[index])
            }
        }
    }
}

@main
struct GoodByeUIKitApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            GoodByeUIKitApp2() // 一番最初に表示されるView: これから作成します
//            MyPage(user: User())
        }
    }
}

// 複数画面で状態を共有
@MainActor
final class User: ObservableObject {
    @Published var isLogin = false
}

struct MyPage: View {
    @ObservedObject var user: User
    var body: some View {
        Button {
            user.isLogin.toggle()
        } label: {
            Text(user.isLogin ? "ログアウト" : "ログイン")
        }
    }
}

struct TopPage: View {
    @ObservedObject var user: User
    var body: some View {
        Text(user.isLogin ? "ログイン済み" : "未ログイン")
    }
}
