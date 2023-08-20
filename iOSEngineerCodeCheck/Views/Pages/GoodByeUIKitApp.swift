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
        Button("ナシ追加", action: {
            stateClass.addList()
        })
        NavigationView {
            List {
                ForEach(stateClass.fruits.indices, id: \.self) { index in
                    NavigationLink(destination: SecondView(info: stateClass.fruits[index])) {
                        Text(stateClass.fruits[index])
                    }
                }
            }
        }
    }
}

struct SecondView: View {
    let info: String
    var body: some View {
        Text(info)
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
    
    func addList() {
        fruits.append("ナシ")
    }
}
