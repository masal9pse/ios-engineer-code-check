//
//  SearchFormField.swift
//  iOSEngineerCodeCheck
//
//  Created by 山本大翔 on 2023/08/27.
//  Copyright © 2023 YUMEMI Inc. All rights reserved.
//

import SwiftUI

struct SearchFormField: View {
    var action: () -> Void
    @Binding var name: String
    var body: some View {
        TextField("キーワードを入力して下さい", text: $name,
                  /// リターンキーが押された時の処理
                  onCommit: {
                      action()
                  })
                  .textFieldStyle(RoundedBorderTextFieldStyle()) // 入力域を枠で囲む
                  .padding() // 余白を追加
        // 編集フラグがONの時に枠に影を付ける
//                  .shadow(color: editting ? .blue : .clear, radius: 3)
    }
}
