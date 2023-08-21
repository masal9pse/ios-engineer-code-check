//
//  GoodByeUIKitApp.swift
//  iOSEngineerCodeCheck
//
//  Created by 山本大翔 on 2023/07/31.
//  Copyright © 2023 YUMEMI Inc. All rights reserved.
//
import SwiftUI

struct GoodByeUIKitApp2: View {
    // @ObservedObjectはflutterでいうcontext?
//    @ObservedObject var stateClass: StateClass
    @ObservedObject var stateClass = StateClass()
//    var clickUseCase = ClickUseCase(stateClass: self.stateClass)
    var body: some View {
        Button("ナシ追加", action: {
            let clickUseCase = ClickUseCase(stateClass: self.stateClass)
            clickUseCase.click()
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
//            GoodByeUIKitApp2(stateClass: StateClass())
            GoodByeUIKitApp2()
        }
    }
}

struct ClickUseCase {
    @ObservedObject var stateClass: StateClass
    func click() {
        stateClass.addList()
    }
}

@MainActor
final class StateClass: ObservableObject {
    @Published var fruits = ["りんご", "オレンジ", "バナナ"]
    
    func addList() {
        fruits.append("ナシ")
    }
}
