//
//  CustomCell.swift
//  SwiftP
//
//  Created by Rushikesh Kulkarni on 08/06/17.
//  Copyright © 2017 simplicity. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var lastNameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
