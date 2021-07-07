//
//  StoryPromptViewController.swift
//  StoryPrompt
//
//  Created by Christian Skorobogatow on 30/6/21.
//

import UIKit

class StoryPromptViewController: UIViewController {

    @IBOutlet weak var storyPromptTextView: UITextView!
    
    
    var storyPrompt: StoryPromptEntry?
    var isNewStoryPrompt = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        storyPromptTextView.text = storyPrompt?.description
        
        if isNewStoryPrompt {
            let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveStoryPrompt))
            let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelStoryPrompt))
            
            navigationItem.rightBarButtonItem = saveButton
            navigationItem.leftBarButtonItem = cancelButton
            
            
        }
        
    }
    

    @objc func cancelStoryPrompt(_ sender: Any) {
        performSegue(withIdentifier: "cancelStoryPrompt", sender: nil)
    }
    
    
    @objc func saveStoryPrompt(_ sender: Any) {
        performSegue(withIdentifier: "saveStoryPrompt", sender: nil)
    }
    
    
    
    
    

}
