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
    @IBOutlet weak var twoSliders: UIView!
    @IBOutlet weak var arrowBtn: UIButton!
    
    var red: CGFloat = 0.0
    var blue: CGFloat = 0.0
    var green: CGFloat = 0.0
    
    var brushSize1: CGFloat = 5.0
    var opacity: CGFloat = 1.0
    
    var delegate: SettingsVCDelagate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        previewDraw(red: red, green: green, blue: blue)
        setColorsliders()
        settingToolsView()
    }
    
    // MARK: Changing brush size
    @IBAction func brushSizeChange(_ sender: Any) {
        brushSize(sender)
    }
    
    // MARK: Changing brush opacity
    @IBAction func opacityChange(_ sender: Any) {
        opacitySet(sender)
    }
    
    // MARK: Back button
    @IBAction func backBtn(_ sender: Any) {
        backButton()
    }
    
    // MARK: Action.- Red Slider
    @IBAction func redSliderChange(_ sender: Any) {
        let slider = sender as! UISlider
        red = CGFloat(slider.value)
        previewDraw(red: red, green: green, blue: blue)
        redLabel.text = "\(Int(slider.value * 255))"
    }
    
    // MARK: Action.- Green Slider
    @IBAction func greenSliderChange(_ sender: Any) {
        let slider = sender as! UISlider
        green = CGFloat(slider.value)
        previewDraw(red: red, green: green, blue: blue)
        greenLabel.text = "\(Int(slider.value * 255))"
    }
    
    // MARK: Action.- Blue Slider
    @IBAction func blueSliderChange(_ sender: Any) {
        let slider = sender as! UISlider
        blue = CGFloat(slider.value)
        previewDraw(red: red, green: green, blue: blue)
        blueLabel.text = "\(Int(slider.value * 255))"
    }
    
}








