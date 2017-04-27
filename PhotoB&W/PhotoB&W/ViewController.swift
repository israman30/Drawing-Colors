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
    
    var lastPoint = CGPoint.zero
    var swipe = false
    
    var red: CGFloat = 0.0
    var green: CGFloat = 0.0
    var blue: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    }
}

