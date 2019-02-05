//
//  Struct.swift
//  FavoriteFilms
//
//  Created by Talip on 5.02.2019.
//  Copyright © 2019 Talip. All rights reserved.
//

import UIKit

struct Film : Codable{
    let title : String
    let year : String
    let imdbId : String
    let type : String
    let posterPath : String
    
    enum CodingKeys : String,CodingKey{
        case title = "Title"
        case year = "Year"
        case imdbId = "imdbID"
        case type = "Type"
        case posterPath = "Poster"
    }
    
    
    init(){
        title = ""
        year = ""
        imdbId = ""
        type = ""
        posterPath = ""
    }
}

//"Title":"Tomorrow Never Dies",
//"Year":"1997",
//"imdbID":"tt0120347",
//"Type":"movie",
//"Poster":"https://m.media-amazon.com/images/M/MV5BMTM1MTk2ODQxNV5BMl5BanBnXkFtZTcwOTY5MDg0NA@@._V1_SX300.jpg"
