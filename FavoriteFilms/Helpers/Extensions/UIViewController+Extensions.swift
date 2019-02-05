//
//  UIViewController+Extensions.swift
//  FavoriteFilms
//
//  Created by Talip on 4.02.2019.
//  Copyright © 2019 Talip. All rights reserved.
//

import UIKit


extension UIViewController{
    
    internal func createAlert(title: String, message: String) {

        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: AppConstant.ok, style: UIAlertAction.Style.default) { alertAction in
            self.dismiss(animated: true)
        })
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func push<T :UIViewController>(storyBoard : UIStoryboard.Storyboard? = .main,targetVC : T,transitionCallBack : ((T)->())? = nil){
        
        let viewController : T = UIStoryboard.storyboard(storyboard: storyBoard!).instantiateVC()
        transitionCallBack?(viewController)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func present<T : UIViewController>(storyBoard : UIStoryboard.Storyboard? = .main,targetVC : T,animated : Bool? = false,transitionCallBack : ((T)->())? = nil){
        
        let viewController : T = UIStoryboard.storyboard(storyboard: storyBoard!).instantiateVC()
        transitionCallBack?(viewController)
        self.present(viewController, animated: animated!, completion: nil)
    }
}
