//
//  UIStoryboard+Extensions.swift
//  FavoriteFilms
//
//  Created by Talip on 4.02.2019.
//  Copyright © 2019 Talip. All rights reserved.
//

import UIKit

extension UIStoryboard {
    enum Storyboard: String {
    
        case main
        
        //Yeni storyboardlar aşağıdaki gibi eklenicek.
        //        case news
        //        case gallery
        var filename: String {
            return rawValue.capitalized
        }
    }
    class func storyboard(storyboard: Storyboard, bundle: Bundle? = nil) -> UIStoryboard {
        return UIStoryboard(name: storyboard.filename, bundle: bundle)
    }
    func instantiateVC<T: UIViewController>() -> T {
        //ViewController ve identifier 'ı aynı olmalı
        return self.instantiateViewController(withIdentifier: T.className) as! T
    }
}
