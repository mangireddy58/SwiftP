//
//  ScroolingImagesController.swift
//  SwiftP
//
//  Created by Rushikesh Kulkarni on 12/06/17.
//  Copyright © 2017 simplicity. All rights reserved.
//

import UIKit
import ImageSlideshow

class ScroolingImagesController: UIViewController, UIScrollViewDelegate {

    var imageTimer = Timer()
    @IBOutlet weak var imageSlideShowView: ImageSlideshow!
   let sdWebImageSource = [SDWebImageSource(urlString: "https://images.unsplash.com/photo-1432679963831-2dab49187847?w=1080")!, SDWebImageSource(urlString: "https://images.unsplash.com/photo-1447746249824-4be4e1b76d66?w=1080")!, SDWebImageSource(urlString: "https://images.unsplash.com/photo-1463595373836-6e0b0a8ee322?w=1080")!]

    @IBOutlet weak var imgScrollView: UIScrollView!
    @IBOutlet weak var imgPageController: UIPageControl!
    var sliderImagesArray = NSMutableArray()
    
//    var colors:[UIColor] = [UIColor.red, UIColor.blue, UIColor.green, UIColor.yellow]
//    var frame: CGRect = CGRect(x: 0, y: 0, width: 0, height: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sliderImagesArray = ["https://images.unsplash.com/photo-1432679963831-2dab49187847?w=1080","https://images.unsplash.com/photo-1447746249824-4be4e1b76d66?w=1080", "https://images.unsplash.com/photo-1463595373836-6e0b0a8ee322?w=1080"]
        
        for i in 0..<sliderImagesArray.count {
//            for i in stride(from: 0, to: sliderImagesArray.count, by: 1) {
            var imageView : UIImageView
            let xOrigin = self.imgScrollView.frame.size.width * CGFloat(i)
            imageView = UIImageView(frame: CGRect(x: xOrigin, y: 0, width: self.imgScrollView.frame.size.width, height: self.imgScrollView.frame.size.height))
            imageView.isUserInteractionEnabled = true
            let urlStr = sliderImagesArray.object(at: i)
            print(imgScrollView,imageView, urlStr)
            imageView.sd_setImage(with: URL(string: urlStr as! String), placeholderImage: UIImage(named: "placeholder.png"))
            imageView .contentMode = UIViewContentMode.scaleToFill
            self.imgScrollView.addSubview(imageView)
        }
//        self.imageTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self,
//        selector: #selector(self.timerDidFire(timer:)), userInfo: nil, repeats: true)
        
        self.imgScrollView.isPagingEnabled = true
        imgScrollView.delegate = self
        self.imgScrollView.bounces = false
        self.imgScrollView.showsVerticalScrollIndicator = false
        self.imgScrollView.showsHorizontalScrollIndicator = false
        self.imgScrollView.contentSize = CGSize(width: self.imgScrollView.frame.size.width * CGFloat(sliderImagesArray.count), height: self.imgScrollView.frame.size.height)
        imgPageController.addTarget(self, action: #selector(self.changePage(sender:)), for: UIControlEvents.valueChanged)
        
        self.imgPageController.numberOfPages = sliderImagesArray.count
        self.imgPageController.currentPage = 0
        self.imgPageController.tintColor = UIColor.red
        self.imgPageController.pageIndicatorTintColor = UIColor.black
        self.imgPageController.currentPageIndicatorTintColor = UIColor.blue
        
/////////////////// 3rd Party
        imageSlideShowView.backgroundColor = UIColor.white
        imageSlideShowView.slideshowInterval = 3.0
        imageSlideShowView.pageControlPosition = PageControlPosition.underScrollView
        imageSlideShowView.pageControl.currentPageIndicatorTintColor = UIColor.black
        imageSlideShowView.pageControl.pageIndicatorTintColor = UIColor.lightGray
        imageSlideShowView.contentScaleMode = UIViewContentMode.scaleAspectFill
        
        // optional way to show activity indicator during image load (skipping the line will show no activity indicator)
        imageSlideShowView.activityIndicator = DefaultActivityIndicator()
        imageSlideShowView.currentPageChanged = { page in
//            print("current page:", page)
        }
        
        // can be used with other sample sources as `afNetworkingSource`, `alamofireSource` or `sdWebImageSource` or `kingfisherSource`
        imageSlideShowView.setImageInputs(sdWebImageSource)
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(ScroolingImagesController.didTap))
        imageSlideShowView.addGestureRecognizer(recognizer)
///////////////////////////////////////
    
    }
    
    // Timer
    @objc private func timerDidFire(timer: Timer) {
        if imgPageController.numberOfPages > imgPageController.currentPage + 1 {
            UIView .animate(withDuration: 0.5, animations: {
                self.imgScrollView.contentOffset = (CGPoint(x:self.imgScrollView.contentOffset.x + self.imgScrollView.frame.size.width, y:0))
            })
        }
        else {
            self.imgScrollView.contentOffset = (CGPoint(x:imgScrollView.contentOffset.x - imgScrollView.frame.size.width, y:0))
            UIView .animate(withDuration: 0.5, animations: {
                self.imgScrollView.contentOffset = (CGPoint(x:self.imgScrollView.contentOffset.x + self.imgScrollView.frame.size.width, y:0))
            })
        }
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let regularContentOffset = imgScrollView.frame.size.width * CGFloat(sliderImagesArray.count)
        if imgScrollView.contentOffset.x >= imgScrollView.frame.size.width * CGFloat(sliderImagesArray.count + 1) {
            imgScrollView.contentOffset = CGPoint(x: imgScrollView.contentOffset.x - regularContentOffset, y: 0)
        } else if imgScrollView.contentOffset.x < 0 {
            imgScrollView.contentOffset = CGPoint(x: imgScrollView.contentOffset.x + regularContentOffset, y: 0)
        }
    }
    // MARK : TO CHANGE WHILE CLICKING ON PAGE CONTROL
    func changePage(sender: AnyObject) -> () {
        let x = CGFloat(imgPageController.currentPage) * imgScrollView.frame.size.width
        imgScrollView.setContentOffset(CGPoint(x: x,y :0), animated: true)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = round(imgScrollView.contentOffset.x / imgScrollView.frame.size.width)
        imgPageController.currentPage = Int(pageNumber)
    }
    /////////tap on image
    func didTap() {
        let fullScreenController = imageSlideShowView.presentFullScreenController(from: self)
        // set the activity indicator for full screen controller (skipping the line will show no activity indicator)
        fullScreenController.slideshow.activityIndicator = DefaultActivityIndicator(style: .white, color: nil)
    }
    
    
}
