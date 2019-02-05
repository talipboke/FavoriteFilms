//
//  DetailVC.swift
//  FavoriteFilms
//
//  Created by Talip on 5.02.2019.
//  Copyright © 2019 Talip. All rights reserved.
//

import UIKit
import Kingfisher

class DetailVC: BaseVC<DetailView> {

    let viewModel = DetailVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        FireBaseManager.logToAnalytics(name: AppConstant.lastOpenedFilmDetail, parameters: try! viewModel.selectedFilm.asDictionary())
        
        renderUI()
    }
    private func renderUI(){
    
        let film = viewModel.selectedFilm
        
        
        HudHelper.shared.showHud()
        castedView.filmImg.kf.setImage(with: URL(string: film.posterPath)) { [unowned self] (image, error, cache, url) in
            self.castedView.filmTitleLbl.text = film.title + " - " + film.year + " - " + film.type
            HudHelper.shared.hideHud()
        }
        
    }

}
