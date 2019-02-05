//
//  Encodable+Extensions.swift
//  FavoriteFilms
//
//  Created by Talip on 6.02.2019.
//  Copyright © 2019 Talip. All rights reserved.
//

import Foundation

extension Encodable {
    func asDictionary() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
            throw NSError()
        }
        
        return dictionary
    }
    
}
