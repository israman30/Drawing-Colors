//
//  SetSettingView.swift
//  PhotoB&W
//
//  Created by Israel Manzo on 9/5/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit

extension SettingsViewController {
    
    func settingToolsView(){
        twoSliders.layer.cornerRadius = 8
        twoSliders.layer.borderColor = UIColor.black.cgColor
        twoSliders.layer.shadowColor = UIColor.black.cgColor
        twoSliders.layer.masksToBounds = false
        twoSliders.layer.shadowOffset = CGSize(width: -1, height: 1)
        twoSliders.layer.shadowRadius = 4
        twoSliders.layer.shadowOpacity = 1
        
        arrowBtn.layer.masksToBounds = false
        arrowBtn.layer.shadowRadius = 4
        arrowBtn.layer.shadowOffset = CGSize(width: -1, height: 1)
        arrowBtn.layer.shadowRadius = 2
        arrowBtn.layer.shadowOpacity = 1
    }
}
