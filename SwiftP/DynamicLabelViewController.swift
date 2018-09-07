//
//  DynamicLabelViewController.swift
//  SwiftP
//
//  Created by Simplicity Macbook Pro on 07/09/18.
//  Copyright © 2018 simplicity. All rights reserved.
//

import UIKit

struct ScreenSize {
    static let SCREEN_WIDTH         = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT        = UIScreen.main.bounds.size.height
    static let SCREEN_MAX_LENGTH    = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH    = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
}

struct DeviceType {
    static let IS_IPHONE       = UIDevice.current.userInterfaceIdiom == .phone
    static let IS_IPHONEX      = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 812.0
    static let IS_IPAD         = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1024.0
    static let IS_IPAD_PRO     = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1366.0
}

class DynamicLabelViewController: UIViewController, UIScrollViewDelegate {

    var mainScrollView = UIScrollView()
    var headerLbl = UILabel()
    var answerLbl = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.designMainScreen()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    func designMainScreen() {
        let scrX:CGFloat = 0.0
        var scrY:CGFloat = 20.0
        let scrW:CGFloat = UIScreen.main.bounds.width
        var scrH:CGFloat = UIScreen.main.bounds.height-40
        if DeviceType.IS_IPHONEX {
            scrY = 44.0
            scrH = UIScreen.main.bounds.height-78
        }
        mainScrollView = UIScrollView.init()
        mainScrollView.backgroundColor = UIColor.red
        mainScrollView.showsVerticalScrollIndicator = false
        mainScrollView.alwaysBounceHorizontal = false
        mainScrollView.delegate = self
        mainScrollView.frame = CGRect(x: scrX, y: scrY, width: scrW, height: scrH)
        self.view .addSubview(mainScrollView)
        
        headerLbl = UILabel.init()
        headerLbl.backgroundColor = UIColor.white
        headerLbl.textAlignment = .center
        headerLbl.numberOfLines = 0
        headerLbl.text = "weyiuwqeyiw wqeiuwq uwioeuw  ouwqoeuw oouwe owueo ouwqoeuo wqueowuqoeuwqoueowqoeu  owueouw e owjeowuoue wq woeowueouwqo uwqeoowueo q woeowoeuow ooweowehiwq ojwehiwhiuewq iwheuwheuwi"
        let lblH_Width:CGFloat  = mainScrollView.frame.size.width-20.0;
        let lblH_Height:CGFloat  = self .getHeightFor(headerLbl, maxLabelWidth: lblH_Width)
        headerLbl.frame = CGRect(x: 10.0, y: 10.0, width: lblH_Width, height: lblH_Height)
        mainScrollView.addSubview(headerLbl)
        
        answerLbl = UILabel.init()
        answerLbl.backgroundColor = UIColor.white
        answerLbl.textAlignment = .center
        answerLbl.numberOfLines = 0
        answerLbl.text = "weyiuwqeyiw wqeiuwq uwioeuw  ouwqoeuw oouwe  ouwqoeuo wqueowuqoeuwqoueowqoeu  owueouw e owjeowuoue wq woeowueouwqo uwqeoowueo q woeowoeuow ooweowehiwq ojwehiwhiuewq iwheuwheuwi weyiuwqeyiw wqeiuwq uwioeuw  ouwqoeuw oouwe  ouwqoeuo wqueowuqoeuwqoueowqoeu  owueouw e owjeowuoue wq woeowueouwqo uwqeoowueo q woeowoeuow ooweowehiwq ojwehiwhiuewq iwheuwheuwi weyiuwqeyiw wqeiuwq uwioeuw  ouwqoeuw oouwe  ouwqoeuo wqueowuqoeuwqoueowqoeu  owueouw e owjeowuoue wq woeowueouwqo uwqeoowueo q woeowoeuow ooweowehiwq ojwehiwhiuewq iwheuwheuwi weyiuwqeyiw wqeiuwq uwioeuw  ouwqoeuw oouwe  ouwqoeuo wqueowuqoeuwqoueowqoeu  owueouw e owjeowuoue wq woeowueouwqo uwqeoowueo q woeowoeuow ooweowehiwq ojwehiwhiuewq iwheuwheuwi weyiuwqeyiw wqeiuwq uwioeuw  ouwqoeuw oouwe  ouwqoeuo wqueowuqoeuwqoueowqoeu  owueouw e owjeowuoue wq woeowueouwqo uwqeoowueo q woeowoeuow ooweowehiwq ojwehiwhiuewq iwheuwheuwi weyiuwqeyiw wqeiuwq uwioeuw  ouwqoeuw oouwe  ouwqoeuo wqueowuqoeuwqoueowqoeu  owueouw e owjeowuoue wq woeowueouwqo uwqeoowueo q woeowoeuow ooweowehiwq ojwehiwhiuewq iwheuwheuwi weyiuwqeyiw wqeiuwq uwioeuw  ouwqoeuw oouwe  ouwqoeuo wqueowuqoeuwqoueowqoeu  owueouw e owjeowuoue wq woeowueouwqo uwqeoowueo q woeowoeuow ooweowehiwq ojwehiwhiuewq iwheuwheuwi weyiuwqeyiw wqeiuwq uwioeuw  ouwqoeuw oouwe  ouwqoeuo wqueowuqoeuwqoueowqoeu  owueouw e owjeowuoue wq woeowueouwqo uwqeoowueo q woeowoeuow ooweowehiwq ojwehiwhiuewq iwheuwheuwi weyiuwqeyiw wqeiuwq uwioeuw  ouwqoeuw oouwe  ouwqoeuo wqueowuqoeuwqoueowqoeu  owueouw e owjeowuoue wq woeowueouwqo uwqeoowueo q woeowoeuow ooweowehiwq ojwehiwhiuewq iwheuwheuwi weyiuwqeyiw wqeiuwq uwioeuw  ouwqoeuw oouwe  ouwqoeuo wqueowuqoeuwqoueowqoeu  owueouw e owjeowuoue wq woeowueouwqo uwqeoowueo q woeowoeuow ooweowehiwq ojwehiwhiuewq iwheuwheuwi weyiuwqeyiw wqeiuwq uwioeuw  ouwqoeuw oouwe  ouwqoeuo wqueowuqoeuwqoueowqoeu  owueouw e owjeowuoue wq woeowueouwqo uwqeoowueo q woeowoeuow ooweowehiwq ojwehiwhiuewq iwheuwheuwi weyiuwqeyiw wqeiuwq uwioeuw  ouwqoeuw oouwe  ouwqoeuo wqueowuqoeuwqoueowqoeu  owueouw e owjeowuoue wq woeowueouwqo uwqeoowueo q woeowoeuow ooweowehiwq ojwehiwhiuewq iwheuwheuwi weyiuwqeyiw wqeiuwq uwioeuw  ouwqoeuw oouwe  ouwqoeuo wqueowuqoeuwqoueowqoeu  owueouw e owjeowuoue wq woeowueouwqo uwqeoowueo q woeowoeuow ooweowehiwq ojwehiwhiuewq iwheuwheuwi"
        
        mainScrollView.addSubview(answerLbl)
        let lbl_Width:CGFloat  = mainScrollView.frame.size.width-20.0;
        let lbl_Height:CGFloat  = self .getHeightFor(answerLbl, maxLabelWidth: lbl_Width)
        answerLbl.frame = CGRect(x: headerLbl.frame.origin.x, y: headerLbl.frame.origin.y+headerLbl.frame.size.height+10.0, width: lbl_Width, height: lbl_Height)
        let scrollCH:CGFloat = answerLbl.frame.origin.y+answerLbl.frame.size.height+10.0
        let contentSizeH:CGFloat = max(scrollCH, self.view.frame.size.height*1.0)
        mainScrollView.contentSize = CGSize(width: self.view.frame.size.width, height: contentSizeH)
    }
    
    
    func getHeightFor(_ thisLabel: UILabel, maxLabelWidth: CGFloat) -> CGFloat {
        let labelSize = thisLabel.sizeThatFits(CGSize(width: maxLabelWidth, height: CGFloat.greatestFiniteMagnitude))
        return labelSize.height
    }
}
