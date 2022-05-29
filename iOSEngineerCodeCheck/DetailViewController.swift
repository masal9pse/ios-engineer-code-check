import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var stargazersCountLable: UILabel!
    @IBOutlet weak var watchersCountLabel: UILabel!
    @IBOutlet weak var forksCountLable: UILabel!
    @IBOutlet weak var issuesCountLabel: UILabel!

    var searchViewController: SearchViewController!

    override func viewDidLoad() {
        super.viewDidLoad()

//        let repo = searchViewController.repo[searchViewController.index]
        let searchItem = searchViewController.items[searchViewController.index]

//        languageLabel.text = "Written in \(repo["language"] as? String ?? "")"
        languageLabel.text = "Written in \(searchItem.language ?? "")"
        stargazersCountLable.text = "\(searchItem.stargazers_count) stars"
//        watchersCountLabel.text = "\(repo["wachers_count"] as? Int ?? 0) watchers"
//        forksCountLable.text = "\(repo["forks_count"] as? Int ?? 0) forks"
//        issuesCountLabel.text = "\(repo["open_issues_count"] as? Int ?? 0) open issues"
//        getImage()
        let k = 3
    }
    

//    func getImage() {
//        let repo = searchViewController.repo[searchViewController.index]
//
//        titleLabel.text = repo["full_name"] as? String
//
//        if let owner = repo["owner"] as? [String: Any] {
//            if let imgURL = owner["avatar_url"] as? String {
//                URLSession.shared.dataTask(with: URL(string: imgURL)!) { data, res, err in
//                    let img = UIImage(data: data!)!
//                    DispatchQueue.main.async {
//                        self.imageView.image = img
//                    }
//                }.resume()
//            }
//        }
//    }
}
