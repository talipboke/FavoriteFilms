//
//  ConnectionManager.swift
//  FavoriteFilms
//
//  Created by Talip on 4.02.2019.
//  Copyright © 2019 Talip. All rights reserved.
//

import UIKit
import Alamofire

class ConnectionManager{
    class var isConnectedToInternet : Bool{
    
        guard let isReachable = NetworkReachabilityManager()?.isReachable else{
            return false
        }
        
        return isReachable
        
    }
}

