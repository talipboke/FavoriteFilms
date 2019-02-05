//
//  SearchResult.swift
//  FavoriteFilms
//
//  Created by Talip on 5.02.2019.
//  Copyright © 2019 Talip. All rights reserved.
//

import Foundation

struct SearchResult : Codable{
    let isSuccess : String
    let error : String?
    
    let films : [Film]?
    
    enum CodingKeys : String,CodingKey{
        case isSuccess = "Response"
        case error = "Error"
        case films = "Search"
    }
}
