//
//  ImageUploading+Extension.swift
//  SwiftP
//
//  Created by Rushikesh Kulkarni on 11/08/17.
//  Copyright © 2017 simplicity. All rights reserved.
//

import UIKit

extension ImageUploadingViewController:UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func fnForImageViewTapped () {
        print("ImageView Tapped")
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print(info)
        var selectedImageFromPicker: UIImage?
        if let editedImage = info["UIImagePickerControllerEditedImage"] as? UIImage{
            selectedImageFromPicker = editedImage
        } else if let originalImage = info["UIImagePickerControllerOriginalImage"] as? UIImage{
            selectedImageFromPicker = originalImage
        }
        if let selectedImage = selectedImageFromPicker {
            userImageView.image = selectedImage
        }
        dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("Cnacel tapped")
        dismiss(animated: true, completion: nil)
    }

    
}
