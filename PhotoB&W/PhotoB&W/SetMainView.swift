//
//  SetMainView.swift
//  PhotoB&W
//
//  Created by Israel Manzo on 9/5/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit

extension ViewController {
    
    func settingDrawBoardView(){
        // Creating an image brush when user tap the view
        tool = UIImageView()
        tool.frame = CGRect(x: view.bounds.size.width, y: view.bounds.size.height, width: 38, height: 38)
        tool.image = #imageLiteral(resourceName: "artist-paint-brush-mrku1gj")
        view.addSubview(tool)
        
        colorSelectionBtnEdit()
        
    }
    
    // MARK: Color selection function
    func colorSelectionBtnEdit(){
        
        blackBtn.layer.cornerRadius = 6
        blackBtn.layer.borderWidth = 1.5
        blackBtn.layer.borderColor = UIColor.black.cgColor
        
        babyBlueBtn.layer.cornerRadius = 6
        babyBlueBtn.layer.borderWidth = 1.5
        babyBlueBtn.layer.borderColor = UIColor.black.cgColor
        
        yellowBtn.layer.cornerRadius = 6
        yellowBtn.layer.borderWidth = 1.5
        yellowBtn.layer.borderColor = UIColor.black.cgColor
        
        pinkBtn.layer.cornerRadius = 6
        pinkBtn.layer.borderWidth = 1.5
        pinkBtn.layer.borderColor = UIColor.black.cgColor
        
        blueBtn.layer.cornerRadius = 6
        blueBtn.layer.borderWidth = 1.5
        blueBtn.layer.borderColor = UIColor.black.cgColor
        
        greenBtn.layer.cornerRadius = 6
        greenBtn.layer.borderWidth = 1.5
        greenBtn.layer.borderColor = UIColor.black.cgColor
        
        redBtn.layer.cornerRadius = 6
        redBtn.layer.borderWidth = 1.5
        redBtn.layer.borderColor = UIColor.black.cgColor
        
        
        // White button
        colorSelection.layer.borderWidth = 1.5
        colorSelection.layer.borderColor = UIColor.black.cgColor
        colorSelection.layer.cornerRadius = 7
        
        toolBoxView.layer.masksToBounds = false
        toolBoxView.layer.shadowOffset = CGSize(width: -1, height: 1)
        toolBoxView.layer.shadowRadius = 2
        toolBoxView.layer.shadowOpacity = 1
        toolBoxView.layer.cornerRadius = 4
    }
}
