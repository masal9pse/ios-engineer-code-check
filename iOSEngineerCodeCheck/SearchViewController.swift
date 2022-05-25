import UIKit
import Alamofire

class SearchViewController: UITableViewController, UISearchBarDelegate {
    @IBOutlet weak var searchBar: UISearchBar!
    
    var repo: [[String: Any]] = []
    
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
            url = "https://api.github.com/search/repositories?q=\(searchedWord!)"
//            task = URLSession.shared.dataTask(with: URL(string: url)!) { data, res, err in
            ////                if let data = try! JSONSerialization.jsonObject(with: data!) as? [String: Any] {
//                if let data = try! JSONSerialization.jsonObject(with: data!) as? [Item] {
//                    let decode = JSONDecoder()
            ////                    let execute = decode.decode(GitHubApiResponse.self, from: data)
            ////                    DispatchQueue.main.async {
            ////                        self.tableView.reloadData()
            ////                    }
//                    let result = try decode.decode(Item.self, from: data)
            ////                    if let items = data["items"] as? [[String: Any]] {
            ////                        self.repo = items
            ////                        DispatchQueue.main.async {
            ////                            self.tableView.reloadData()
            ////                        }
            ////                    }
//                }
//            }
//            // これ呼ばなきゃリストが更新されません
//            task?.resume()
//            let header: HTTPHeaders = ["Accept": "application/x-www-form-urlencoded"]
            Alamofire.request(url, method: .get, encoding: JSONEncoding(options: [])).responseJSON { response in
                // debugPrint(response)
                do {
                    guard let data = response.data else {
                        return
                    }
                    let decode = JSONDecoder()
                    let result = try decode.decode(GitHubApiResponse.self, from: data)
                    print(result)
                } catch {}
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Detail" {
            let detail = segue.destination as! DetailViewController
            detail.searchViewController = self
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repo.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let repo = repo[indexPath.row]
        cell.textLabel?.text = repo["full_name"] as? String ?? ""
        cell.detailTextLabel?.text = repo["language"] as? String ?? ""
        cell.tag = indexPath.row
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 画面遷移時に呼ばれる
        index = indexPath.row
        performSegue(withIdentifier: "Detail", sender: self)
    }
}
