//
//  GoodByeUIKitApp.swift
//  iOSEngineerCodeCheck
//
//  Created by 山本大翔 on 2023/07/31.
//  Copyright © 2023 YUMEMI Inc. All rights reserved.
//

import SwiftUI

struct GoodByeUIKitApp2: View {
    @ObservedObject var stateClass: StateClass
    var body: some View {
        Button("hit gitHubAPI", action: {
            stateClass.fruits.append("ナシ")
        })
        List {
            ForEach(stateClass.fruits.indices, id: \.self) { index in
                Text(stateClass.fruits[index])
            }
        }
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
