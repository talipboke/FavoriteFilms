//
//  ViewController.swift
//  FavoriteFilms
//
//  Created by Talip on 4.02.2019.
//  Copyright © 2019 Talip. All rights reserved.
//

import UIKit

class LauncherVC: BaseVC<LauncherView> {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.checkInternetConnection()

    }
    private func checkInternetConnection(){
        ConnectionManager.isConnectedToInternet ? goToHomePage() : createAlert(title: AppConstant.notice, message: AppConstant.internetError)
    }
    private func goToHomePage(){
        
        FireBaseManager.setupRemoteConfigDefaults()
        FireBaseManager.fetchRemoteConfig { [unowned self] (companyName) in
            self.castedView.companylbl.text = companyName
            
            self.delay(AppConstant.delayTime) {
                self.present(targetVC: HomeNavigationController(), animated: true)
            }
        }

    }
    
}

