//
//  GitHubApiRepository.swift
//  iOSEngineerCodeCheck
//
//  Created by 山本大翔 on 2022/05/23.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import Foundation

class GitHubApiRepository {
    func getGitHubApiResponse(searchedWord: String, comp: @escaping ([Item]) -> Void) {
        let api = URL(string: "https://api.github.com/search/repositories?q=\(searchedWord)")
           
        URLSession.shared.dataTask(with: api!) {
            data, response, error in
            if error != nil {
//                   print(error?.localizedDescription)
                return
            }
            do {
                print(api!)
                guard let data = data else {
                    return
                }
                let result = try! JSONDecoder().decode(GitHubApiResponse.self, from: data)
                print(result.total_count)
                print(result.items)
                comp(result.items)
            } catch {}
        }.resume()
    }
}
