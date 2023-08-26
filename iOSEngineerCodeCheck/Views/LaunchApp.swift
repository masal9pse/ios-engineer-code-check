//
//  LaunchApp.swift
//  iOSEngineerCodeCheck
//
//  Created by 山本大翔 on 2023/08/27.
//  Copyright © 2023 YUMEMI Inc. All rights reserved.
//

import SwiftUI

@main
struct LaunchApp: App {
    var body: some Scene {
        WindowGroup {
            DI()
        }
    }
}

// diをするクラスがviewにあるのは不自然
struct DI: View {
    var body: some View {
        SearchPage()
    }
}
