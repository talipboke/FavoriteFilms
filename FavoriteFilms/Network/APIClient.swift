//
//  APIClient.swift
//  FavoriteFilms
//
//  Created by Talip on 5.02.2019.
//  Copyright © 2019 Talip. All rights reserved.
//

import UIKit
import RxAlamofire
import Alamofire
import RxSwift

class APIClient{
    
    static let manager: SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 60
        return SessionManager(configuration: configuration)
    }()
    
    @discardableResult
    class func performRequest<T : Codable>(route : APIConfiguration,type : T.Type) -> Single<T>{
        
        return APIClient.manager.rx.request(route.method, route.url, parameters: route.parameters, encoding: route.encoding, headers: route.headers)
            
            .validate(statusCode: 200..<201)
            .data()
            //TODO : try kısmı düzeltilecek.
            .map{
                try! JSONDecoder().decode(type, from: $0)
                
            }
            .asSingle()
        
    }
}
