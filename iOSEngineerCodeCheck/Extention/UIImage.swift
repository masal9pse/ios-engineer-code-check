//
//  UIImage.swift
//  iOSEngineerCodeCheck
//
//  Created by 山本大翔 on 2023/01/19.
//  Copyright © 2023 YUMEMI Inc. All rights reserved.
//

import UIKit

public extension UIImage {
    convenience init(url: String) async {
        let url = URL(string: url)
        do {
            let data = try await URLSession.shared.data(from: url!)
            self.init(data: data.0)!
            return
        } catch let err {
            print("Error : \(err.localizedDescription)")
        }
        self.init()
    }
}
