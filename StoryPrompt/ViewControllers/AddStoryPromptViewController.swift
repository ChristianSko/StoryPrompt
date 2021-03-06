//
//  ViewController.swift
//  StoryPrompt
//
//  Created by Christian Skorobogatow on 25/6/21.
//

import UIKit
import PhotosUI

class AddStoryPromptViewController: UIViewController {
    
    @IBOutlet weak var nounTextfield: UITextField!
    @IBOutlet weak var adjectiveTextfield: UITextField!
    @IBOutlet weak var verbTextfield: UITextField!
    @IBOutlet weak var storyPromptImageView: UIImageView!
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var numberSlider: UISlider!
    
    let storyPrompt = StoryPromptEntry()
    
    @IBAction func changedNumber(_ sender: UISlider) {
        
        numberLabel.text = "Number \(Int(sender.value))"
        storyPrompt.number = Int(sender.value)
    }
    
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        numberSlider.value = 7.5
                    
        
        storyPromptImageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changeImage))
        
        storyPromptImageView.addGestureRecognizer(gestureRecognizer)
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateStoryPrompt), name: UIResponder.keyboardDidHideNotification, object: nil)
        
        
    }
    
    @IBAction func changedStoryType(_ sender: UISegmentedControl) {
        if let genre = StoryPrompts.Genre(rawValue: sender.selectedSegmentIndex) {
            storyPrompt.genre = genre
        } else {
            storyPrompt.genre = .scifi
        }
            
        print(storyPrompt.genre)
    }
    
    
    @objc func changeImage() {
        var configuration = PHPickerConfiguration()
        configuration.filter = .images
        configuration.selectionLimit = 1
        
        let controller = PHPickerViewController(configuration: configuration)
        controller.delegate = self
        present(controller, animated: true)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "StoryPrompt" {
            guard let storyPromptViewController = segue.destination as? StoryPromptViewController else {
                return
            }
            storyPromptViewController.storyPrompt = storyPrompt
            storyPromptViewController.isNewStoryPrompt = true
        }
    }
    
    @objc func updateStoryPrompt() {
        storyPrompt.noun        = nounTextfield.text ?? ""
        storyPrompt.adjective   = adjectiveTextfield.text ?? ""
        storyPrompt.verb        = verbTextfield.text ?? ""
    }
    
    @IBAction func generateStoryPrompt(_ sender: Any) {
        updateStoryPrompt()
        if storyPrompt.isValid() {
            performSegue(withIdentifier: "StoryPrompt", sender: nil)
        } else {
            let alert = UIAlertController(title: "Invalid Story Prompt", message: "Please fill out all of the fields", preferredStyle: .alert)
            
            let action  = UIAlertAction(title: "Ok", style: .default, handler: { action in
                
            })
            alert.addAction(action)
            present(alert, animated: true)
            
        }
        
        
        
       
    }
    
}

extension AddStoryPromptViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        
        return true
    }
}

extension AddStoryPromptViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        if !results.isEmpty {
            let result = results.first!
            let itemProvider = result.itemProvider
            if itemProvider.canLoadObject(ofClass: UIImage.self) {
                itemProvider.loadObject(ofClass: UIImage.self) { [weak self] image, error in
                    guard let image = image as? UIImage else {
                        return
                    }
                    DispatchQueue.main.async {
                        self?.storyPromptImageView.image = image
                    }
                }
            }
        }
    }
}
