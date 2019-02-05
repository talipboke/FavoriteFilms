//
//  APIConfiguration.swift
//  FavoriteFilms
//
//  Created by Talip on 5.02.2019.
//  Copyright © 2019 Talip. All rights reserved.
//

import Foundation
import Alamofire

internal protocol APIConfiguration{
    var method: HTTPMethod { get }
    var url: URL { get }
    var parameters: Parameters? { get }
    var encoding: ParameterEncoding { get }
    var headers: HTTPHeaders { get }
}
