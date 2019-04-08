//
//  TestTableViewCell.swift
//  AutoLayout
//
//  Created by ek1008 on 2019/4/8.
//  Copyright © 2019 ek1008. All rights reserved.
//

import UIKit

class TestTableViewCell: UITableViewCell {

    @IBOutlet weak var dataTitle: UILabel!
    @IBOutlet weak var dataImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
