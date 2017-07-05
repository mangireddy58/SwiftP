//
//  CollectionViewCell.swift
//  SwiftP
//
//  Created by Rushikesh Kulkarni on 08/06/17.
//  Copyright © 2017 simplicity. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var countryNameLbl: UILabel!
    @IBOutlet weak var capitalNameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
