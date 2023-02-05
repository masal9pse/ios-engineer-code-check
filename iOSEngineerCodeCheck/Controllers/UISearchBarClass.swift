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
    var presentTableView = TableViewClass()
    
    func initSearchBar(withContentController: UIViewController, withContentTableView: TableViewClass) {
        presentController = withContentController
        presentTableView = withContentTableView
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
//                    initSearchBar(withContentController: presentController, withContentTableView: presentTableView)
                    presentTableView.reloadTableViewWith(withData: response, withContentController: presentController)
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
