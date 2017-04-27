//
//  SettingsViewController.swift
//  PhotoB&W
//
//  Created by Israel Manzo on 4/27/17.
//  Copyright © 2017 Israel Manzo. All rights reserved.
//

import UIKit

protocol SettingsVCDelagate: class {
    func settingsVCDidFinish(_ settingsVC: SettingsViewController )
    
}

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
    
    var red: CGFloat = 0.0
    var blue: CGFloat = 0.0
    var green: CGFloat = 0.0
    
    var delegate: SettingsVCDelagate?
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        previewDraw(red: red, green: green, blue: blue)
        
        redSlider.value = Float(red)
        redLabel.text = String(Int(redSlider.value * 255))
        
        greenSlider.value = Float(green)
        greenLabel.text = String(Int(greenSlider.value * 255))
        
        blueSlider.value = Float(blue)
        blueLabel.text = String(Int(blueSlider.value * 255))

        
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
        
        if delegate != nil {
            delegate?.settingsVCDidFinish(self)
        }
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func redSliderChange(_ sender: Any) {
        
        let slider = sender as! UISlider
        red = CGFloat(slider.value)
        previewDraw(red: red, green: green, blue: blue)
        redLabel.text = "\(Int(slider.value * 255))"
    }
    
    @IBAction func greenSliderChange(_ sender: Any) {
        
        let slider = sender as! UISlider
        green = CGFloat(slider.value)
        previewDraw(red: red, green: green, blue: blue)
        greenLabel.text = "\(Int(slider.value * 255))"
    }
    @IBAction func blueSliderChange(_ sender: Any) {
        
        let slider = sender as! UISlider
        blue = CGFloat(slider.value)
        previewDraw(red: red, green: green, blue: blue)
        blueLabel.text = "\(Int(slider.value * 255))"
    }
    
    func previewDraw(red: CGFloat, green: CGFloat, blue: CGFloat){
        imageView.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }

}








