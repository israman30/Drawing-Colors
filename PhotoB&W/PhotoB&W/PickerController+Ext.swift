//
//  PickerController+Ext.swift
//  PhotoB&W
//
//  Created by Israel Manzo on 9/5/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit

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
