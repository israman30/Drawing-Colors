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
    
    var lastPoint = CGPoint.zero
    var swipe = false
    
    var red: CGFloat = 0.0
    var green: CGFloat = 0.0
    var blue: CGFloat = 0.0
    
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
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        swipe = false
        if let touch = touches.first {
            lastPoint = touch.location(in: self.view)
        }
    }
    
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
        context?.setLineWidth(5)
        context?.setStrokeColor(UIColor(red: red, green: green, blue: blue, alpha: 1.0).cgColor)
        context?.strokePath()
        
        imagePhoto.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
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

    @IBAction func resetBtn(_ sender: Any) {
        self.imagePhoto.image = nil
    }
    
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
    
    @IBAction func saveBtn(_ sender: Any) {
        
        if let image = imagePhoto.image {
            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        }
    }
    
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

extension ViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let imagePicker = info[UIImagePickerControllerOriginalImage] {
            
        }
    }
}





