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
        
        redSlider.value = Float(red)
        redLabel.text = String(Int(redSlider.value * 255))
        
        greenSlider.value = Float(green)
        greenLabel.text = String(Int(greenSlider.value * 255))
        
        blueSlider.value = Float(blue)
        blueLabel.text = String(Int(blueSlider.value * 255))
        
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
        
//        if delegate != nil {
//            delegate?.settingsVCDidFinish(self)
//        }
//        dismiss(animated: true, completion: nil)
    }
    
    func backButton(){
        
        delegate != nil ? delegate?.settingsVCDidFinish(self) : dismiss(animated: true, completion: nil)
//        if delegate != nil {
//            delegate?.settingsVCDidFinish(self)
//        }
//        dismiss(animated: true, completion: nil)
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
    
    // MARK: Preview drawing function
    func previewDraw(red: CGFloat, green: CGFloat, blue: CGFloat){
        UIGraphicsBeginImageContext(imageView.frame.size)
        
        let context = UIGraphicsGetCurrentContext()
        context?.setStrokeColor(UIColor(red: red, green: green, blue: blue, alpha: opacity).cgColor)
        context?.setLineWidth(brushSize1)
        context?.setLineCap(CGLineCap.round)
        context?.move(to: CGPoint(x: 70, y: 70))
        context?.addLine(to: CGPoint(x: 70, y: 70))
        context?.strokePath()
        
        imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }

}








