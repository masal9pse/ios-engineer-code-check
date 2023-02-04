import UIKit

final class SearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var tableView: UITableView!
    var items: [Item] = []
    let indicator = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.placeholder = "GitHubのリポジトリを検索できます"
        searchBar.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
        // 表示位置を設定（画面中央）
        indicator.center = view.center
        // インジケーターのスタイルを指定（白色＆大きいサイズ）
        indicator.style = .whiteLarge
        // インジケーターの色を設定（青色）
        indicator.color = UIColor(red: 44 / 255, green: 169 / 255, blue: 225 / 255, alpha: 1)
        // インジケーターを View に追加
        view.addSubview(indicator)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let searchedWord = searchBar.text ?? ""
        indicator.startAnimating()
        if !searchedWord.isEmpty {
            let gitHubApiResponse = GitHubApiRepository()
            Task {
                do {
                    let response = try await gitHubApiResponse.getGitHubApiResponse(searchedWord: searchedWord)
                    DispatchQueue.main.async {
                        self.items = response
                        self.tableView.reloadData()
                        self.indicator.stopAnimating()
                    }
                } catch {
                    print(error)
                }
            }
        }
        // キーボードを下ろす。
        view.endEditing(true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as? TableViewCell {
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
        navigationController?.pushViewController(nextVC, animated: true)
    }
}
