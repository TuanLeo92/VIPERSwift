//
//  AnimalCell.swift
//  VIPERSwift
//
//  Created by Le Tuan on 18/2/19.
//  Copyright © 2019 Le Tuan. All rights reserved.
//

import UIKit

class AnimalCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var animal: Animal? {
        didSet {
            if let animal = animal {
                if let image = animal.image {
                    avatarImageView.image = UIImage(named: image)
                    nameLabel.text = animal.name
                }
            } else {
                avatarImageView.image = nil
                nameLabel.text = nil
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        
        avatarImageView.layer.cornerRadius = avatarImageView.frame.width / 2.0
        avatarImageView.layer.borderWidth = 1.0
        avatarImageView.layer.borderColor = UIColor.lightGray.cgColor
        avatarImageView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
