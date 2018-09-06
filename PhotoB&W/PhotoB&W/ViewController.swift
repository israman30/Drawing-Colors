//
//  ViewController.swift
//  PhotoB&W
//
//  Created by Israel Manzo on 4/26/17.
//  Copyright © 2017 Israel Manzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imagePhoto: UIImageView!
    @IBOutlet weak var toolEraserIcon: UIButton!
    @IBOutlet weak var colorSelection: UIButton!
    @IBOutlet weak var toolBoxView: UIView!
    @IBOutlet weak var blackBtn: UIButton!
    @IBOutlet weak var babyBlueBtn: UIButton!
    @IBOutlet weak var yellowBtn: UIButton!
    @IBOutlet weak var pinkBtn: UIButton!
    @IBOutlet weak var blueBtn: UIButton!
    @IBOutlet weak var greenBtn: UIButton!
    @IBOutlet weak var redBtn: UIButton!
    
    var lastPoint = CGPoint.zero
    var swipe = false
    
    var red: CGFloat = 0.0
    var green: CGFloat = 0.0
    var blue: CGFloat = 0.0
    
    var brushSize: CGFloat = 9.0
    
    var opacity: CGFloat = 1.0
    
    var tool:UIImageView!
    var isDrawing = true
    
    var selectedImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingDrawBoardView()
        
    }
    
    // MARK: Prepare for segue function
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        let settingsVC = segue.destination as! SettingsViewController
        settingsVC.delegate = self
        settingsVC.red = red
        settingsVC.blue = blue
        settingsVC.green = green
        settingsVC.brushSize1 = brushSize
        settingsVC.opacity = opacity
    }

    // MARK: Reset/Clearing view after drawing
    @IBAction func resetBtn(_ sender: Any) {
        self.imagePhoto.image = nil
    }
    
    // MARK: Action.- Pick color
    @IBAction func pickColorBtn(_ sender: Any) {
        pickColorSetting(sender)
    }
    
    // MARK: Saving a drawing with alert sheet + photo picker
    @IBAction func saveBtn(_ sender: Any) {
        saveButtonSetting()
    }
    
    // MARK: Erase draw line switching the icon of brush to eraser.
    @IBAction func eraseBtn(_ sender: Any) {
        eraseButtonSetting()
    }
        
}








