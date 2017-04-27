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
        
//        twoSliders.layer.borderWidth = 0.5
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
    
    // MARK: Changing brush size
    @IBAction func brushSizeChange(_ sender: Any) {
        
        let slider = sender as! UISlider
        brushSize1 = CGFloat(slider.value)
        previewDraw(red: red, green: green, blue: blue)
    }
    
    // MARK: Changing brush opacity
    @IBAction func opacityChange(_ sender: Any) {
        
        let slider = sender as! UISlider
        opacity = CGFloat(slider.value)
        previewDraw(red: red, green: green, blue: blue)
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
    
    // MARK: Preview drawing function
    func previewDraw(red: CGFloat, green: CGFloat, blue: CGFloat){
//        imageView.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
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








