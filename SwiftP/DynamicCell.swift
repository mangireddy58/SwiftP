//
//  DynamicCell.swift
//  PrototypeCells
//
//  Created by Rushikesh Kulkarni on 19/07/17.
//  Copyright © 2017 simplicity. All rights reserved.
//

import UIKit

class DynamicCell: UITableViewCell {

    @IBOutlet weak var dataTxtView: UITextView!
    @IBOutlet weak var dataLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
