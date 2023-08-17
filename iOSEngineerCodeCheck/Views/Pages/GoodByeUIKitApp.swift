//
//  GoodByeUIKitApp.swift
//  iOSEngineerCodeCheck
//
//  Created by 山本大翔 on 2023/07/31.
//  Copyright © 2023 YUMEMI Inc. All rights reserved.
//

import SwiftUI

struct GoodByeUIKitApp2: View {
    @State private var fruits = ["りんご", "オレンジ", "バナナ"]
    var body: some View {
        Button("hit gitHubAPI", action: {
            fruits.append("ナシ")
        })
        List {
            ForEach(fruits.indices, id: \.self) { index in
                Text(fruits[index])
            }
//            ForEach(0 ..< fruits.count) { index in
//                Text(fruits[index])
//            }
        }
    }
}

@main
struct GoodByeUIKitApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            GoodByeUIKitApp2() // 一番最初に表示されるView: これから作成します
        }
    }
}
