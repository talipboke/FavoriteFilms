//
//  HudHelper.swift
//  FavoriteFilms
//
//  Created by Talip on 5.02.2019.
//  Copyright © 2019 Talip. All rights reserved.
//

import UIKit

class HudHelper{
    
    private init() {}
    
    static let shared = HudHelper()
    
    private var hudToHide : ProgressHudView?
    private var isVisible : Bool = false

    public func showHud(){
        
        if !isVisible{
            let hud = ProgressHudView(frame: CGRect(x: 0,y: 0,width: HudHelper.getScreenWidth(),height: HudHelper.getScreenHeight()))
            hud.awakeFromNib()
            hudToHide = hud
            HudHelper.getAppDelegate().window?.addSubview(hud)
            isVisible = true
        }
    }
    public func hideHud(){
        if isVisible{
            hudToHide!.hide()
            isVisible = false
        }
        
    }
    class func getAppDelegate() -> AppDelegate {
        
        return UIApplication.shared.delegate as! AppDelegate
        
    }
    class func getScreenHeight() -> CGFloat {
        
        return UIScreen.main.bounds.size.height
        
    }
    
    class func getScreenWidth() -> CGFloat {
        
        return UIScreen.main.bounds.size.width
        
    }
}
