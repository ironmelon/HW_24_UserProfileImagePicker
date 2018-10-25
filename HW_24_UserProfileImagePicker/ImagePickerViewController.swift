//
//  ImagePickerViewController.swift
//  HW_24_UserProfileImagePicker
//
//  Created by Oleg Dynnikov on 10/19/18.
//  Copyright © 2018 Oleg Dynnikov. All rights reserved.
//

import UIKit

class ImagePickerViewController: UIViewController {

    @IBOutlet private weak var photoView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        updateDefaultImage()
    }

    private func updateDefaultImage() {
        photoView.image = #imageLiteral(resourceName: "defaultGallery")
    }

    // MARK: - Actions
    @IBAction private func pickedFromGallery(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }

    @IBAction private func reset(_ sender: Any) {
        updateDefaultImage()
    }
}

// MARK: - Extensions
extension ImagePickerViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: Any]) {
        photoView.image = info[UIImagePickerControllerEditedImage] as? UIImage
        dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
