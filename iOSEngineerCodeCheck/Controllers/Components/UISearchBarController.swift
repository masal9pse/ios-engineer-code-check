//
//  UISearchBarClass.swift
//  iOSEngineerCodeCheck
//
//  Created by 山本大翔 on 2023/02/05.
//  Copyright © 2023 YUMEMI Inc. All rights reserved.
//

import UIKit

final class UISearchBarController: UISearchBar, UISearchBarDelegate {
    var presentController = UIViewController()
    var presentTableView = TableViewController()
    let indicator = UIActivityIndicatorView()
    
    func initSearchBar(withContentController: UIViewController, withContentTableView: TableViewController) {
        presentController = withContentController
        presentTableView = withContentTableView
        self.delegate = self
        self.placeholder = "GitHubのリポジトリを検索できます"
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        viewIndicator()
        Task {
            await hitApiResponseView(searchedWord: searchBar.text ?? "")
        }
        presentController.view.endEditing(true)
    }
    
    private func viewIndicator() {
        indicator.center = presentController.view.center
        // インジケーターのスタイルを指定（白色＆大きいサイズ）
        indicator.style = .large
        // インジケーターの色を設定（青色）
        indicator.color = UIColor(red: 44 / 255, green: 169 / 255, blue: 225 / 255, alpha: 1)
        // インジケーターを View に追加
        presentController.view.addSubview(indicator)
        indicator.startAnimating()
    }
    
    private func hitApiResponseView(searchedWord: String) async {
        defer {
            self.indicator.stopAnimating()
        }
        
        do {
            let uiSearchBarModel = UISearchBarModel()
            let response = try await uiSearchBarModel.getGitHubApi(searchedWord: searchedWord)
            presentTableView.reloadTableViewWith(withData: response, withContentController: presentController)
        } catch {
            presentTableView.reloadTableViewWith(withData: [], withContentController: presentController)
            print(error)
        }
    }
}
