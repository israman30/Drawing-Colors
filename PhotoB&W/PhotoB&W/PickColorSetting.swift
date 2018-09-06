//
//  PickColorSetting.swift
//  PhotoB&W
//
//  Created by Israel Manzo on 9/5/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit


extension ViewController {
    
    func pickColorSetting(_ sender: Any){
        if (sender as AnyObject).tag == 0 {
            (red, green, blue) = (1, 0, 0)
        } else if (sender as AnyObject).tag == 1 {
            (red, green, blue) = (0, 1, 0)
        } else if (sender as AnyObject).tag == 2 {
            (red, green, blue) = (0, 0, 1)
        } else if (sender as AnyObject).tag == 3 {
            (red, green, blue) = (1, 0, 1)
        } else if  (sender as AnyObject).tag == 4 {
            (red, green, blue) = (1, 1, 0)
        } else if (sender as AnyObject).tag == 5 {
            (red, green, blue) = (0, 1, 1)
        } else if (sender as AnyObject).tag == 6 {
            (red, green, blue) = (1, 1, 1)
        } else if (sender as AnyObject).tag == 7 {
            (red, green, blue) = (0, 0, 0)
        }
    }
}
