//
//  MenuHeaderCell.swift
//  SwiftP
//
//  Created by Rushikesh Kulkarni on 28/06/17.
//  Copyright © 2017 simplicity. All rights reserved.
//

import UIKit

class MenuHeaderCell: UITableViewCell {

    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userMenuNameLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
