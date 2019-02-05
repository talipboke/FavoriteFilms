//
//  BaseVC.swift
//  FavoriteFilms
//
//  Created by Talip on 4.02.2019.
//  Copyright © 2019 Talip. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa



class BaseVC<V : UIView>: UIViewController {

    // MARK: - Variables
    public var castedView: V! {
        guard isViewLoaded else { return nil }
        return view as? V //as! V
    }
    
    private let tapGestureRecognizer = UITapGestureRecognizer()
    internal let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    private func setKeyboardObserver(){
        self.view.addGestureRecognizer(tapGestureRecognizer)
        tapGestureRecognizer.rx.event
            .bind(onNext : { [unowned self] _ in
                self.view.endEditing(true)
            }).disposed(by: disposeBag)
    }
    

}
