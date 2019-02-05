//
//  HomeVC.swift
//  FavoriteFilms
//
//  Created by Talip on 4.02.2019.
//  Copyright © 2019 Talip. All rights reserved.
//

import UIKit
//AutoComplete ve Scheduler için tekrar yazıldı.
import RxSwift

class HomeVC : BaseVC<HomeView> {
    
    //VM'e taşınacak.
    
    private let viewModel = HomeVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.registerCells()
        
        self.castedView.searchBar.rx.text.asObservable()
            .throttle(0.2, scheduler: MainScheduler.instance)
            .subscribe(onNext: { (searchText) in
                self.viewModel.searchFilms(title: searchText ?? "")
            }).disposed(by: viewModel.disposeBag)
        
    
        viewModel.films.asDriver()
            .drive(castedView.table.rx.items(cellIdentifier: FilmCell.className,cellType : FilmCell.self))
            { (_,film,cell) in
                cell.filmAndYearLbl.text = film.title + " - " + film.year
            }
            .disposed(by: viewModel.disposeBag)
        
        castedView.table.rx.modelSelected(Film.self)
            .subscribe(onNext : {
                
                let film = $0
                self.push(targetVC: DetailVC(), transitionCallBack: { (nextVC) in
                    nextVC.viewModel.selectedFilm = film
                })
                
 
            }).disposed(by: viewModel.disposeBag)
    
    }
    private func registerCells(){
        castedView.table.register(cellIdentifier: FilmCell.className)
    }
    
}
