import UIKit
import Alamofire

class SearchViewController: UITableViewController, UISearchBarDelegate {
    @IBOutlet private weak var searchBar: UISearchBar!
    
    var items: [Item] = []
    var searchedWord: String = ""
    var index: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.text = "GitHubのリポジトリを検索できるよー"
        searchBar.delegate = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
    }
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.text = ""
        return true
    }
            
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchedWord = searchBar.text ?? ""
        
        if !searchedWord.isEmpty {
            let gitHubApiResponse = GitHubApiRepository()
            Task.detached {
                do {
                    let response = try await gitHubApiResponse.getGitHubApiResponse(searchedWord: self.searchedWord)
                    DispatchQueue.main.async {
                        self.items = response
                        self.tableView.reloadData()
                    }
                } catch {
                    print(error)
                }
            }
        }
        // キーボードを下ろす。
        view.endEditing(true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as? TableViewCell {
            let item = items[indexPath.row]
            cell.setup(item: item)
            return cell
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath.row
        let storyboard = UIStoryboard(name: "DetailPage", bundle: nil)
        let nextVC = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        nextVC.searchedItem = self.items[index]
        navigationController?.pushViewController(nextVC, animated: true)
    }
}
