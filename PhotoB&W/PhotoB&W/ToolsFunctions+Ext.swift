//
//  ToolsFunctions+Ext.swift
//  PhotoB&W
//
//  Created by Israel Manzo on 9/5/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit

extension SettingsViewController {
    
    func brushSize(_ sender: Any){
        let slider = sender as! UISlider
        brushSize1 = CGFloat(slider.value)
        previewDraw(red: red, green: green, blue: blue)
    }
    
    func opacitySet(_ sender: Any){
        let slider = sender as! UISlider
        opacity = CGFloat(slider.value)
        previewDraw(red: red, green: green, blue: blue)
    }
    
    func backButton(){
        if delegate != nil {
            delegate?.settingsVCDidFinish(self)
        }
        dismiss(animated: true, completion: nil)
    }
    
    
}
