//
//  CollectionViewController.swift
//  SwiftP
//
//  Created by Rushikesh Kulkarni on 08/06/17.
//  Copyright © 2017 simplicity. All rights reserved.
//

import UIKit

let VIEWHEIGHT  = UIScreen.main.bounds.size.height
let VIEWWIDTH   = UIScreen.main.bounds.size.width

let BOUNDS = UIScreen.main.bounds
let HEIGHT = BOUNDS.size.height
let WIDTH  = BOUNDS.size.width

class CollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var demoCollectionView: UICollectionView!
    var imagesArray = ["1.jpg","2.jpg", "3.jpg",  "1.jpg","2.jpg", "3.jpg", "1.jpg","2.jpg", "3.jpg","1.jpg","2.jpg", "3.jpg"]
    var nameArray = ["Test1","Test2","Test3","Test4","Test5","Test6","Test7","Test8","Test9","Test10","Test11","Test12"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        demoCollectionView.dataSource = self
        demoCollectionView.delegate = self
        demoCollectionView.bounces = false
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
        layout.itemSize = CGSize(width: WIDTH/3, height: WIDTH/3)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        demoCollectionView!.collectionViewLayout = layout
        
        switch HEIGHT {
        case 568.0:
            print("iPhone 5")
        case 667.0:
            print("iPhone 6")
        case 736.0:
            print("iPhone 6+")
            
        default:
            print("not an iPhone")
        }

    }
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesArray.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = demoCollectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cell.imgView.image = UIImage (named: imagesArray[indexPath.row])
        cell.countryNameLbl.text = nameArray[indexPath.row]
//        cell.layer.cornerRadius = 50
//        cell.layer.borderColor = UIColor .lightGray.cgColor
//        cell.layer.borderWidth = 3
        cell.imgView.contentMode = .scaleAspectFill
        return cell
    }

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        switch HEIGHT {
//        case 568.0:
//            return CGSize(width:260, height:185)
//        case 667.0:
//            return CGSize(width:260, height:185)
//            
//        case 736.0:
//            return CGSize(width:260, height:185)
//        default:
//            break
//            
//        }
//        return CGSize(width: 150, height: 285)
//    }
////    return CGSize(width:demoCollectionView.frame.size.width, height:185)
}
