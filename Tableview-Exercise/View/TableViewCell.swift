//
//  TableViewCell.swift
//  Tableview-Exercise
//
//  Created by mai.dinh.chuong on 3/22/19.
//  Copyright © 2019 Sun-Asterisk Inc. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleText: UILabel!
    @IBOutlet weak var detailText: UILabel!
    @IBOutlet weak var imageViews: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
