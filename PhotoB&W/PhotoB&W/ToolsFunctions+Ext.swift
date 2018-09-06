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
    
    // MARK: - This function assign each color to each label by slider value
    func setColorsliders(){
        redSlider.value = Float(red)
        redLabel.text = String(Int(redSlider.value * 255))
        
        greenSlider.value = Float(green)
        greenLabel.text = String(Int(greenSlider.value * 255))
        
        blueSlider.value = Float(blue)
        blueLabel.text = String(Int(blueSlider.value * 255))
    }
}
