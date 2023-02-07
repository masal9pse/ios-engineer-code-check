import UIKit

final class SearchViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBarClass!
    @IBOutlet weak var tableView: TableViewClass!
    
    var items: [Item] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.initSearchBar(withContentController: self, withContentTableView: tableView)
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
        tableView.reloadTableViewWith(withData: [], withContentController: self)
    }
}
