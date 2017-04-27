//
//  SettingsViewController.swift
//  PhotoB&W
//
//  Created by Israel Manzo on 4/27/17.
//  Copyright © 2017 Israel Manzo. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var brushSize: UILabel!
    
    @IBOutlet weak var opacityLabel: UILabel!
    
    @IBOutlet weak var redLabel: UILabel!
    
    @IBOutlet weak var greenLabel: UILabel!
    
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    
    @IBOutlet weak var greenSlider: UISlider!
    
    @IBOutlet weak var blueSlider: UISlider!
     
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func brushSizeChange(_ sender: Any) {
    }
    
    @IBAction func opacityChange(_ sender: Any) {
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backBtn(_ sender: Any) {
    }
    
    @IBAction func redSliderChange(_ sender: Any) {
    }
    
    @IBAction func greenSliderChange(_ sender: Any) {
    }
    @IBAction func blueSliderChange(_ sender: Any) {
    }

}
