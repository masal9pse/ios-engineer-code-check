import UIKit
import Alamofire

class SearchViewController: UITableViewController, UISearchBarDelegate {
    @IBOutlet weak var searchBar: UISearchBar!
    
    var items: [Item] = []
    let gitHubApiResponse = GitHubApiRepository()
    
    var task: URLSessionTask?
    var searchedWord: String!
    var url: String!
    var index: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchBar.text = "GitHubのリポジトリを検索できるよー"
        searchBar.delegate = self
    }
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        // ↓こうすれば初期のテキストを消せる
        searchBar.text = ""
        return true
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        task?.cancel()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchedWord = searchBar.text!
        
        if searchedWord.count != 0 {
            gitHubApiResponse.getGitHubApiResponse(searchedWord: searchedWord, comp: { data in
                self.items = data
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            })
        }
//        task?.resume()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Detail" {
//            let detail = segue.destination as! DetailViewController
//            detail.searchViewController = self
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return repo.count
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let item = items[indexPath.row]

        cell.textLabel?.text = item.name
//        cell.detailTextLabel?.text = repo["language"] as? String ?? ""
        cell.tag = indexPath.row
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 画面遷移時に呼ばれる
        index = indexPath.row
        performSegue(withIdentifier: "Detail", sender: self)
    }
}
