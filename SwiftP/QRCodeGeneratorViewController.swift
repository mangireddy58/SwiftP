//
//  QRCodeGeneratorViewController.swift
//  SwiftP
//
//  Created by Rushikesh Kulkarni on 25/07/17.
//  Copyright © 2017 simplicity. All rights reserved.
//

import UIKit

class QRCodeGeneratorViewController: UIViewController {

    @IBOutlet weak var textFld: UITextField!
    @IBOutlet weak var qrCodeImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func generateQRCodeAction(_ sender: Any) {
        let data = textFld.text?.data(using: .ascii, allowLossyConversion: false)
        let filter = CIFilter(name: "CIQRCodeGenerator")
        filter?.setValue(data, forKey: "inputMessage")
        let image = UIImage(ciImage: (filter?.outputImage)!)
        qrCodeImageView.image = image
    }
    

}
