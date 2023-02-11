//
//  DetailViewModel.swift
//  iOSEngineerCodeCheck
//
//  Created by 山本大翔 on 2023/02/11.
//  Copyright © 2023 YUMEMI Inc. All rights reserved.
//

class DetailViewModel {
    func getLanguage(language: String?) -> String {
        guard let language else {
            return ""
        }
        
        if language.isEmpty {
            return ""
        }
        
        return "Written in \(language)"
    }
}
