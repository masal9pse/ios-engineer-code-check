import UIKit
import Nuke

final class DetailViewController: UIViewController {
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var languageLabel: UILabel!
    @IBOutlet private weak var stargazersCountLable: UILabel!
    @IBOutlet private weak var watchersCountLabel: UILabel!
    @IBOutlet private weak var forksCountLable: UILabel!
    @IBOutlet private weak var issuesCountLabel: UILabel!

    // すでに値が入っていることが確定しているので暗黙的アンラップ型を使用
    var searchedItem: Item!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        languageLabel.text = "Written in \(searchedItem.language ?? "")"
        stargazersCountLable.text = "\(searchedItem.stargazersCount) stars"
        watchersCountLabel.text = "\(searchedItem.watchersCount) watchers"
        forksCountLable.text = "\(searchedItem.forksCount) forks"
        issuesCountLabel.text = "\(searchedItem.openIssuesCount) open issues"
        Task {
            await getImage()
        }
    }
    
    func getImage() async {
        titleLabel.text = searchedItem.fullName
        
        if let owner = searchedItem.owner {
            if let imageUrl = owner.avatarUrl {
                Nuke.loadImage(with: URL(string: imageUrl), into: self.imageView)
            }
        }
    }
}
