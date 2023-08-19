//
//  GoodByeUIKitApp.swift
//  iOSEngineerCodeCheck
//
//  Created by 山本大翔 on 2023/07/31.
//  Copyright © 2023 YUMEMI Inc. All rights reserved.
//
// リンクを表示
// 画面遷移のやり方
// 詳細ページを表示
import SwiftUI

struct GoodByeUIKitApp2: View {
    @ObservedObject var stateClass: StateClass
    var body: some View {
        Button("ナシ追加", action: {
            stateClass.fruits.append("ナシ")
        })
        NavigationView {
            List {
                ForEach(stateClass.fruits.indices, id: \.self) { index in
                    // 遷移しない
                    //                NavigationView {
                    //                    NavigationLink(destination: SecondView()) {
                    //                        Text("画面遷移")
                    //                    }
                    //                }
                    NavigationLink(destination: SecondView()) {
                        Text("画面遷移")
                    }
                    Text(stateClass.fruits[index])
                }
            }
        }
    }
}

struct SecondView: View {
    var body: some View {
        Text("画面遷移")
    }
}

@main
struct GoodByeUIKitApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            GoodByeUIKitApp2(stateClass: StateClass())
        }
    }
}

@MainActor
final class StateClass: ObservableObject {
    @Published var fruits = ["りんご", "オレンジ", "バナナ"]
}
