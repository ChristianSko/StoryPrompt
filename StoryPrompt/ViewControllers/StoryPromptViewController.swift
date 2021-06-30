//
//  StoryPromptViewController.swift
//  StoryPrompt
//
//  Created by Christian Skorobogatow on 30/6/21.
//

import UIKit

class StoryPromptViewController: UIViewController {

    @IBOutlet weak var storyPromptTextView: UITextView!
    
    
    var storyPrompt = StoryPromptEntry()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        storyPrompt.noun = "toasts"
        storyPrompt.adjective = "smelly"
        storyPrompt.verb = "burbs"
        storyPrompt.number = 7
        
        storyPromptTextView.text = storyPrompt.description
        
    }
    

   

}
