import UIKit

// final class SearchViewController: UIViewController, UISearchBarDelegate {
final class SearchViewController: UIViewController {
    @IBOutlet private weak var searchBar: UISearchBarClass!
    @IBOutlet weak var tableView: TableViewClass!
    
    var items: [Item] = []
//    let indicator = UIActivityIndicatorView()
    override func viewDidLoad() {
        super.viewDidLoad()
//        searchBar.placeholder = "GitHubのリポジトリを検索できます"
//        searchBar.delegate = self
//        searchBar.initSearchBar(withContentController: self)
        searchBar.initSearchBar(withContentController: self, withContentTableView: tableView)
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
//        searchBar.initSearchBar(withContentController: self)
        tableView.reloadTableViewWith(withData: [], withContentController: self)
//        searchBar.initSearchBar(withContentController: self)
//        searchBar.placeholder = "GitHubのリポジトリを検索できます"
        // 表示位置を設定（画面中央）
//        indicator.center = view.center
//        // インジケーターのスタイルを指定（白色＆大きいサイズ）
//        indicator.style = .whiteLarge
//        // インジケーターの色を設定（青色）
//        indicator.color = UIColor(red: 44 / 255, green: 169 / 255, blue: 225 / 255, alpha: 1)
//        // インジケーターを View に追加
//        view.addSubview(indicator)
    }
    
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        let searchedWord = searchBar.text ?? ""
//        indicator.startAnimating()
//        if !searchedWord.isEmpty {
//            let gitHubApiResponse = GitHubApiRepository()
//            Task {
//                do {
//                    let response = try await gitHubApiResponse.getGitHubApiResponse(searchedWord: searchedWord)
//                    tableView.reloadTableViewWith(withData: response, withContentController: self)
//                    DispatchQueue.main.async {
//                        self.indicator.stopAnimating()
//                    }
//                } catch {
//                    print(error)
//                }
//            }
//        }
//        // キーボードを下ろす。
//        view.endEditing(true)
//    }
}
