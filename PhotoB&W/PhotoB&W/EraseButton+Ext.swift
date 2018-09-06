//
//  EraseButton+Ext.swift
//  PhotoB&W
//
//  Created by Israel Manzo on 9/5/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit

extension ViewController {
    
    func eraseButtonSetting(){
        if isDrawing {
            (red, green, blue) = (1, 1, 1)
            tool.image = #imageLiteral(resourceName: "eraserIcon")
            toolEraserIcon.setImage(#imageLiteral(resourceName: "artist-paint-brush-mrku1gj"), for: .normal)
        } else {
            (red, green, blue) = (0, 0, 0)
            tool.image = #imageLiteral(resourceName: "artist-paint-brush-mrku1gj")
            toolEraserIcon.setImage(#imageLiteral(resourceName: "eraserIcon"), for: .normal)
        }
        
        isDrawing = !isDrawing
    }

}


