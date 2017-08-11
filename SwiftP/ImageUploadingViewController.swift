//
//  ImageUploadingViewController.swift
//  SwiftP
//
//  Created by Rushikesh Kulkarni on 11/08/17.
//  Copyright © 2017 simplicity. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage
import FirebaseDatabase

class ImageUploadingViewController: UIViewController {

    @IBOutlet weak var userImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        userImageView.image = UIImage(named: "3.png")
        userImageView.contentMode = .scaleAspectFill
        userImageView.isUserInteractionEnabled = true
        userImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(fnForImageViewTapped)))
    }
    

}
