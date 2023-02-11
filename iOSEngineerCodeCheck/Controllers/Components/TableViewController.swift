//
//  TableViewPresenter.swift
//  iOSEngineerCodeCheck
//
//  Created by 山本大翔 on 2023/02/05.
//  Copyright © 2023 YUMEMI Inc. All rights reserved.
//

import UIKit

final class TableViewController: UITableView, UITableViewDataSource, UITableViewDelegate {
    var items: [Item] = []
    var presentController = UIViewController()
    func reloadTableViewWith(withData: [Item], withContentController: UIViewController) {
        items = withData
        presentController = withContentController
        self.dataSource = self
        self.delegate = self
        self.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as? TableViewCellController {
            let item = items[indexPath.row]
            cell.setup(item: item)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        let storyboard = UIStoryboard(name: "DetailPage", bundle: nil)
        let nextVC = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        nextVC.searchedItem = self.items[index]
        presentController.navigationController?.pushViewController(nextVC, animated: true)
    }
}
