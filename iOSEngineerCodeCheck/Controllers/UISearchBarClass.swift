//
//  UISearchBarClass.swift
//  iOSEngineerCodeCheck
//
//  Created by 山本大翔 on 2023/02/05.
//  Copyright © 2023 YUMEMI Inc. All rights reserved.
//

import UIKit

class UISearchBarClass: UISearchBar, UISearchBarDelegate {
    var presentController = UIViewController()
//    var  = UIViewController()
    
    func initSearchBar(withContentController: UIViewController) {
        presentController = withContentController
//        self.delegate = self
        self.delegate = self
        self.placeholder = "GitHubのリポジトリを検索できます"
//        searchBar.placeholder = "GitHubのリポジトリを検索できます"
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let searchedWord = searchBar.text ?? ""
//        indicator.startAnimating()
        if !searchedWord.isEmpty {
            let gitHubApiResponse = GitHubApiRepository()
            Task {
                do {
                    let response = try await gitHubApiResponse.getGitHubApiResponse(searchedWord: searchedWord)
                    let k = 3
                    let ki = 3
//                    tableView.reloadTableViewWith(withData: response, withContentController: self)
//                    DispatchQueue.main.async {
//                        self.indicator.stopAnimating()
//                    }
                } catch {
                    print(error)
                }
            }
        }
        // キーボードを下ろす。
        presentController.view.endEditing(true)
    }
}
