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
        
        // Creating an image brush when user tap the view
        tool = UIImageView()
        tool.frame = CGRect(x: self.view.bounds.size.width, y: self.view.bounds.size.height, width: 38, height: 38)
        tool.image = #imageLiteral(resourceName: "artist-paint-brush-mrku1gj")
        self.view.addSubview(tool)
        
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
    
    //MARK: Drawing a line function
    func drawnLine(from: CGPoint, to: CGPoint){
        UIGraphicsBeginImageContext(self.view.frame.size)
        imagePhoto.image?.draw(in: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        
        let context = UIGraphicsGetCurrentContext()
        context?.move(to: CGPoint(x: from.x, y: from.y))
        context?.addLine(to: CGPoint(x: to.x, y: to.y))
        // Brush image
        tool.center = to
        
        context?.setBlendMode(.normal)
        context?.setLineCap(CGLineCap.round)
        context?.setLineWidth(brushSize) // Brush size variable value
        context?.setStrokeColor(UIColor(red: red, green: green, blue: blue, alpha: opacity).cgColor)
        context?.strokePath()
        
        imagePhoto.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    // MARK: Drawing functions by touch
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        swipe = false
        if let touch = touches.first {
            lastPoint = touch.location(in: self.view)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        swipe = true
        if let touch = touches.first {
            let currentPoint = touch.location(in: self.view)
            drawnLine(from: lastPoint , to: currentPoint)
            
            lastPoint = currentPoint
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !swipe {
            drawnLine(from: lastPoint, to: lastPoint)
        }
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
    
    // MARK: Saving a drawing with alert sheet + photo picker
    @IBAction func saveBtn(_ sender: Any) {
        
        let actionSheet = UIAlertController(title: "Pick a Choice", message: "", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Pick an image", style: .default, handler: { (UIAlertAction) in
            
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = true
            imagePicker.delegate = self
            
            self.present(imagePicker, animated: true, completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Save your art", style: .default, handler: { (UIAlertAction) in
            
            if let image = self.imagePhoto.image {
                UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
            }
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        
        present(actionSheet, animated: true, completion: nil)
    }
    
    // MARK: Erase draw line switching the icon of brush to eraser.
    @IBAction func eraseBtn(_ sender: Any) {
        
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


// MARK: Extension.- Picker controller
extension ViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate, SettingsVCDelagate {
    
    // MARK: Picker controller delegate functions
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let imagePicker = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.selectedImage = imagePicker
            self.imagePhoto.image = selectedImage
            
            dismiss(animated: true, completion: nil)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: Setting view controller
    func settingsVCDidFinish(_ settingsVC: SettingsViewController) {
        self.red = settingsVC.red
        self.blue = settingsVC.blue
        self.green = settingsVC.green
        self.brushSize = settingsVC.brushSize1
        self.opacity = settingsVC.opacity
    }
}





