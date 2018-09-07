//
//  ScrollingImagesWithXib.swift
//  SwiftP
//
//  Created by Rushikesh Kulkarni on 25/07/17.
//  Copyright © 2017 simplicity. All rights reserved.
//

import UIKit

class ScrollingImagesWithXib: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var featureScrollView: UIScrollView!
    @IBOutlet weak var featurePageControl: UIPageControl!
    
    let feature1 = ["title":"Apple Watch","price":"$0.99","image":"1"]
    let feature2 = ["title":"More Designs","price":"$1.99","image":"2"]
    let feature3 = ["title":"Notifications","price":"$0.99","image":"3"]
    
    var featureArray = [Dictionary<String,String>]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        featureArray = [feature1,feature2,feature3]
        
        featureScrollView.isPagingEnabled = true
        featureScrollView.contentSize = CGSize(width: self.view.bounds.width * CGFloat(featureArray.count), height: featureScrollView.frame.size.height)
        featureScrollView.showsHorizontalScrollIndicator = false
        featureScrollView.isPagingEnabled = true
        featureScrollView.isScrollEnabled = true
        featureScrollView.bounces = false
        featureScrollView.alwaysBounceVertical = false
        featureScrollView.showsHorizontalScrollIndicator = false
        
        featureScrollView.delegate = self
        
        
        loadFeatures()
        
        
    }
    
    
    func loadFeatures() {
        
        for (index, feature) in featureArray.enumerated() {
            if let featureView = Bundle.main.loadNibNamed("Feature", owner: self, options: nil)?.first as? FeatureView {
                featureView.featureImageView.image = UIImage(named: feature["image"]!)
                featureView.titleLabel.text = feature["title"]
                featureView.priceLabel.text = feature["price"]
                
                featureView.purchaseButton.tag = index
                featureView.purchaseButton.addTarget(self, action: #selector(ScrollingImagesWithXib.buyFeature(sender:)), for: .touchUpInside)
                
                featureScrollView.addSubview(featureView)
                featureView.frame.size.width = self.view.bounds.size.width
                featureView.frame.origin.x = CGFloat(index) * self.view.bounds.size.width
                
            }
            
        }
        
        
    }
    
    func buyFeature (sender:UIButton) {
        print("The user wants to buy feature \(sender.tag)")
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page = scrollView.contentOffset.x / scrollView.frame.size.width
        featurePageControl.currentPage = Int(page)
    }
    
    
    
    
}
