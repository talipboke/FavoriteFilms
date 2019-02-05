//
//  FirebaseManager.swift
//  FavoriteFilms
//
//  Created by Talip on 4.02.2019.
//  Copyright © 2019 Talip. All rights reserved.
//

import UIKit
import Firebase

class FireBaseManager{
    
    private static let companyName = "company_name"
    
    class func setupRemoteConfigDefaults(){
        let defaultValues = [
            companyName : "" as NSObject
        ]
        RemoteConfig.remoteConfig().setDefaults(defaultValues)
    }
    class func fetchRemoteConfig(closure : @escaping (String)->()){
        
        RemoteConfig.remoteConfig().fetch {(status, error) in
            guard error == nil else{
                print("Bir hata oluştu.\(String(describing: error))")
                return
            }
            RemoteConfig.remoteConfig().activateFetched()
            
            let companyString = RemoteConfig.remoteConfig().configValue(forKey: companyName).stringValue ?? ""
            closure(companyString)
        }
    }
    class func logToAnalytics(name : String , parameters : [String : Any]?){
        Analytics.logEvent(name, parameters: parameters)
    }
}
