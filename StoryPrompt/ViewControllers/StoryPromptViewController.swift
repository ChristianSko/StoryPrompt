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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        storyPromptTextView.text = storyPrompt?.description
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

   

}