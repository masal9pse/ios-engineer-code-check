//
//  GitHubApiRepository.swift
//  iOSEngineerCodeCheck
//
//  Created by 山本大翔 on 2022/05/23.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import Foundation
import Alamofire

class GitHubApiRepository {
    func getGitHubApiInfo(searchedWord: String)-> Any {
        let url = "https://api.github.com/search/repositories?q=\(searchedWord)"
//        Alamofire.request(url, method: .get, encoding: JSONEncoding(options: [])).responseJSON { response in
        Alamofire.request(url, method: .get, encoding: JSONEncoding(options: [])).responseJSON {response in
            // debugPrint(response)
//            do {
//                guard let data = response.data else {
//                    return
//                }
//                let decode = JSONDecoder()
//                let result = try decode.decode(GitHubApiResponse.self, from: data)
//                print(result)
////                return result
//                return Success(code: nil, response: result)
//            } catch {
//                return Failure(code: 100, errorResponse: "No Invalid")
//            }
            switch response.result {
            case .success(let value as [Item]):
                
            }
    }
        // 一度取得したresultを外に出してreturnしないとだめ？
}
}
