//
//  UITableView+Extensions.swift
//  FavoriteFilms
//
//  Created by Talip on 5.02.2019.
//  Copyright © 2019 Talip. All rights reserved.
//

import UIKit

extension UITableView{
    func register(cellIdentifier : String){
        let nib = UINib(nibName: cellIdentifier, bundle: nil)
        self.register(nib, forCellReuseIdentifier: cellIdentifier)
    }
}
