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

    var searchedItem: Item? {
        didSet(oldItem) {
            if oldItem != nil {
                searchedItem = oldItem
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateRepositoryInfo()
    }
    
    private func updateRepositoryInfo() {
        guard let searchedItem else {
            return
        }
        
        let model = DetailViewModel()
        languageLabel.text = model.getLanguage(language: searchedItem.language)
        stargazersCountLable.text = "\(searchedItem.stargazersCount) stars"
        watchersCountLabel.text = "\(searchedItem.watchersCount) watchers"
        forksCountLable.text = "\(searchedItem.forksCount) forks"
        issuesCountLabel.text = "\(searchedItem.openIssuesCount) open issues"
        
        titleLabel.text = searchedItem.fullName
        if let owner = searchedItem.owner {
            if let imageUrl = owner.avatarUrl {
                Nuke.loadImage(with: URL(string: imageUrl), into: self.imageView)
            }
        }
    }
}
