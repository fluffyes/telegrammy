//
//  ChatTableViewCell.swift
//  telegrammy
//
//  Created by Soulchild on 04/04/2019.
//  Copyright © 2019 fluffy. All rights reserved.
//

import UIKit

class ChatTableViewCell: UITableViewCell {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        self.avatarImageView.layer.cornerRadius = self.avatarImageView.bounds.height / 2.0
        self.avatarImageView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
