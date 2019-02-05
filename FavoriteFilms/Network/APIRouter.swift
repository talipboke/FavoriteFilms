//
//  APIRouter.swift
//  FavoriteFilms
//
//  Created by Talip on 5.02.2019.
//  Copyright © 2019 Talip. All rights reserved.
//

//
//  APIRouter.swift
//  PhotoDrop
//
//  Created by Talip on 19.12.2018.
//  Copyright © 2018 Doğu Emre DEMİRÇİVİ. All rights reserved.
//

import Foundation
import Alamofire

enum APIRouter : APIConfiguration {
    
    case searchFilms(title : String)
    
    internal var method: HTTPMethod {
        switch self{
        case .searchFilms:
            return .get
        }
    }
    
    private static let baseUrl = APIConstant.baseUrl
    

    var url: URL{
        
        var relativeUrl = APIRouter.baseUrl
        
        switch self{
        case .searchFilms:
            break
        }
        
        return URL(string: relativeUrl)!
    }
    
    internal var parameters: Parameters?{
        switch self{
        case .searchFilms(title : let title):
            return [AppConstant.apiKeyParam : AppConstant.apiKey, AppConstant.searchParam : title]
            //return nil
        }
    }
    
    var encoding: ParameterEncoding{
        switch self {
        case .searchFilms:
            return URLEncoding.default
        }
    }
    
    var headers: HTTPHeaders {
        var dictionary = [String: String]()
        
        dictionary["Content-Type"] = "application/json"
        
        
        switch self {
        case .searchFilms:
            break
        }
        return dictionary
    }
    
    
}

