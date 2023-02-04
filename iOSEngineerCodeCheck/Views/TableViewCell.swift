//
//  TableViewCell.swift
//  iOSEngineerCodeCheck
//
//  Created by 山本大翔 on 2023/01/28.
//  Copyright © 2023 YUMEMI Inc. All rights reserved.
//

import UIKit
import Nuke

final class TableViewCell: UITableViewCell {
    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var smallImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(item: Item) async {
        label.text = item.name
        if let owner = item.owner {
            if let imageUrl = owner.avatarUrl {
                Nuke.loadImage(with: URL(string: imageUrl), into: self.smallImageView)
            }
        }
    }
}
