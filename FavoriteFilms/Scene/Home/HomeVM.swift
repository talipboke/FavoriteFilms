//
//  HomeVM.swift
//  FavoriteFilms
//
//  Created by Talip on 5.02.2019.
//  Copyright © 2019 Talip. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class HomeVM : BaseVM{
    //internal var searchText = Variable<String>("")
    
    internal lazy var films: Variable<[Film]> = Variable([])
    
    
    internal func searchFilms(title : String){
        HudHelper.shared.showHud()
        APIClient.performRequest(route: APIRouter.searchFilms(title: title), type: SearchResult.self)
            .subscribe(onSuccess: { (searchResult) in
                
                //print(searchResult.isSuccess + " " + (searchResult.error ?? "") + "Search Sayı\(searchResult.films?.count ?? 0)" )
                self.films.value = searchResult.films ?? []
                HudHelper.shared.hideHud()
                
            }, onError: { (error) in
                print(error)
                HudHelper.shared.hideHud()
                
            }).disposed(by: disposeBag)
    }
}



