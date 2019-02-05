//
//  ProgressHudView.swift
//  FavoriteFilms
//
//  Created by Talip on 5.02.2019.
//  Copyright © 2019 Talip. All rights reserved.
//

import UIKit

class ProgressHudView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        Bundle.main.loadNibNamed(ProgressHudView.className, owner: self, options: nil)
        contentView.frame = self.frame
        //self.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        self.addSubview(contentView)
        attachRotationAnimation()
    }
    internal func hide(){
        //Request çok hızlı :D
        delay(0.15) {
            self.removeFromSuperview()
        }
    }
    private func attachRotationAnimation(){
        self.imageView.rotate(speed: 0.60)
    }
}
