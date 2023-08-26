//
//  GoodByeUIKitApp.swift
//  iOSEngineerCodeCheck
//
//  Created by 山本大翔 on 2023/07/31.
//  Copyright © 2023 YUMEMI Inc. All rights reserved.
//
import SwiftUI

struct SearchPage: View {
    @ObservedObject var stateClass = StateClass()
    var body: some View {
        Button("ナシ追加", action: {
            let clickUseCase = ClickUseCase(stateClass: self.stateClass)
            clickUseCase.click()
        })
        CircleCheck_Previews.previews
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

struct CircleCheck_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Text("テスト")
        }
    }
}

struct SecondView: View {
    let info: String
    var body: some View {
        Text(info)
    }
}

struct ClickUseCase {
    @ObservedObject var stateClass: StateClass
    func click() {
        stateClass.addList()
    }
}
