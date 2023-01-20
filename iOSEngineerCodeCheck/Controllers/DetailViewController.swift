import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var stargazersCountLable: UILabel!
    @IBOutlet weak var watchersCountLabel: UILabel!
    @IBOutlet weak var forksCountLable: UILabel!
    @IBOutlet weak var issuesCountLabel: UILabel!

    // すでに値が入っていることが確定しているので暗黙的アンラップ型を使用
    var searchViewController: SearchViewController!
    var searchedItem: Item!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchedItem = searchViewController.items[searchViewController.index]

        languageLabel.text = "Written in \(searchedItem.language ?? "")"
        stargazersCountLable.text = "\(searchedItem.stargazersCount) stars"
        watchersCountLabel.text = "\(searchedItem.watchersCount) watchers"
        forksCountLable.text = "\(searchedItem.forksCount) forks"
        issuesCountLabel.text = "\(searchedItem.openIssuesCount) open issues"
        getImage()
    }
    
    func getImage() {
        titleLabel.text = searchedItem.fullName
        
        if let owner = searchedItem.owner {
            if let imageUrl = owner.avatarUrl {
                let image = UIImage(url: imageUrl)
                self.imageView.image = image
            }
        }
    }
}
